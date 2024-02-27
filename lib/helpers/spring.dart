import 'package:animated_home_app/utils/rope_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/provs.dart';

class Spring {
  final TickerProvider tickerProvider;

  Spring({
    required this.ref,
    required this.tickerProvider,
  }) : _tickerProvider = tickerProvider;

  final WidgetRef ref;
  SpringSimulation? springSimX, springSimY;

  Ticker? ticker;
  final TickerProvider _tickerProvider;

  final springDesc = const SpringDescription(
    mass: 1.0,
    stiffness: 500.0,
    damping: 10.0,
  );

  void onSpringStart() {
    final velocity = ref.watch(velocityProvider);
    final RopeUtils util = RopeUtils();
    //The curve P.O.I / T.P / S.P
    //Link the spring to the rope using the anchor.
    springSimY = SpringSimulation(
        springDesc, util.anchor().y * 0.5, util.anchor().y * 0.2, velocity.dy);
    springSimX = SpringSimulation(
        springDesc, util.anchor().y * 0.35, util.anchor().x * 0.2, velocity.dx);

    ticker ??= _tickerProvider.createTicker(_onTick);
    if (ticker?.isActive == false) ticker?.start();
  }

  void _onTick(Duration elapsedTime) {
    final time = elapsedTime.inMilliseconds / 1000.0;

    ref.watch(springValueYProvider.notifier).state = springSimY!.x(time);
    ref.watch(springValueXProvider.notifier).state = springSimX!.x(time);

    ref.read(velocityProvider.notifier).state = Offset(
      springSimX!.dx(time),
      springSimY!.dx(time),
    );

    if (springSimY!.isDone(time) && springSimX!.isDone(time)) onSpringEnd();
  }

  void onSpringEnd() {
    if (ticker != null) ticker?.stop();
  }
}
