import 'package:animated_home_app/utils/provs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../painters/rope_painter.dart';

class Rope extends ConsumerStatefulWidget {
  const Rope({super.key});

  @override
  ConsumerState<Rope> createState() => _RopeState();
}

class _RopeState extends ConsumerState<Rope>
    with SingleTickerProviderStateMixin {
  //
  late final AnimationController animationController;
  late final Animation<double> pathAnimation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350))
      ..forward()
      ..repeat();

    pathAnimation =
        Tween<double>(begin: 0.0, end: -400.0).animate(animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDrag = ref.watch(isPlugDraggedProvider);
    final springValX = ref.watch(springValueXProvider);
    final springValY = ref.watch(springValueYProvider);

    return AnimatedBuilder(
      animation: pathAnimation,
      builder: (context, child) {
        return CustomPaint(
          willChange: true,
          foregroundPainter: RopePainter(
            isDrag: isDrag,
            pathAnimationValue: pathAnimation.value,
            springValY: springValY,
            springValX: springValX,
          ),
          child: Container(),
        );
      },
    );
  }
}
