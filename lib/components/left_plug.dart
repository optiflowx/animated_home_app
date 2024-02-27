// ignore_for_file: non_constant_identifier_names
import 'package:animated_home_app/data/plug_socket_input_data.dart';
import 'package:animated_home_app/model/rope_color.dart';
import 'package:animated_home_app/utils/provs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/plugs.dart';
import '../helpers/spring.dart';
import '../utils/rope_utils.dart';

class LeftPlug extends ConsumerStatefulWidget {
  const LeftPlug({super.key});

  @override
  ConsumerState<LeftPlug> createState() => _LeftPlugState();
}

class _LeftPlugState extends ConsumerState<LeftPlug>
    with TickerProviderStateMixin {
  //Getting info about the rope from RopeUtils
  final RopeUtils util = RopeUtils();
  double x = 0.0, y = 0.0;

  @override
  Widget build(BuildContext context) {
    final color = ref.watch(colorProvider);
    final isDrag = ref.watch(isPlugDraggedProvider);
    const greyColor = Color(0xFF747C8E);
    const strokeGColor = Color(0xFF74727A);
    final borderColor = ref.watch(borderColorProvider);

    return Positioned(
      left: Plugs.LP.x,
      top: Plugs.LP.y,
      child: GestureDetector(
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        child: AnimatedContainer(
          height: Plugs.LP.height,
          width: Plugs.LP.width,
          decoration: BoxDecoration(
            color: isDrag ? greyColor : color,
            border: Border.all(
                color: isDrag ? strokeGColor : borderColor, width: 4),
            borderRadius: BorderRadius.circular(50.0),
          ),
          duration: const Duration(milliseconds: 250),
        ),
      ),
    );
  }

  void onPanStart(DragStartDetails details) {
    ref.read(colorProvider.notifier).state = const Color(0xFF747C8E);
    ref.read(borderColorProvider.notifier).state = const Color(0xFF74727A);
    ref.read(containerColorProvider.notifier).state = const Color(0xFFA7A7AE);
    ref.read(isPlugDraggedProvider.notifier).state = true;
  }

  void onPanUpdate(DragUpdateDetails details) {
    //To the current values of [Plugs.LP.x && Plugs.LP.y]
    ///We add the delta dx & dy, respectively;
    setState(() {
      RopeM.ropeColor = const Color.fromARGB(255, 116, 124, 142);
      Plugs.LP.x += details.delta.dx;
      Plugs.LP.y += details.delta.dy;
    });

    x = Plugs.LP.x; //Checking variables
    y = Plugs.LP.y; //Checking variables
  }

  void onPanEnd(DragEndDetails details) {
    final Spring spring = Spring(ref: ref, tickerProvider: this);
    setState(() {
      if (x >= 0 && x <= 100 && y >= 0 && y <= 90) {
        Plugs.LP.x = 39.0;
        Plugs.LP.y = 51.0;
        Plugs.LP.posX = 39.0;
        Plugs.LP.posY = 51.0;

        ref.read(leftIndexProvider.notifier).state = 0;
        ref.read(colorProvider.notifier).state =
            PlugSocketInputData.data[0].iconColor;
        ref.read(borderColorProvider.notifier).state =
            PlugSocketInputData.data[0].strokeColor;
        RopeM.ropeColor = PlugSocketInputData.data[0].iconColor;
      } else if (x >= 0 && x <= 100 && y >= 146 && y <= 221) {
        //Container 1 Boundaries: x = min(0), max(78) & y = min(146), max(221)
        Plugs.LP.x = 39.0;
        Plugs.LP.y = 183.0;
        Plugs.LP.posX = 39.0;
        Plugs.LP.posY = 183.0;

        ref.read(leftIndexProvider.notifier).state = 1;

        ref.read(colorProvider.notifier).state =
            PlugSocketInputData.data[1].iconColor;
        ref.read(borderColorProvider.notifier).state =
            PlugSocketInputData.data[1].strokeColor;
        RopeM.ropeColor = PlugSocketInputData.data[1].iconColor;
      } else if (x >= 0 && x <= 100 && y >= 278 && y <= 354) {
        //Container 1 Boundaries: x = min(0), max(78) & y = min(278), max(354)
        Plugs.LP.x = 39.0;
        Plugs.LP.y = 315.0;
        Plugs.LP.posX = 39.0;
        Plugs.LP.posY = 315.0;

        ref.read(leftIndexProvider.notifier).state = 2;

        ref.read(colorProvider.notifier).state =
            PlugSocketInputData.data[2].iconColor;
        ref.read(borderColorProvider.notifier).state =
            PlugSocketInputData.data[2].strokeColor;
        // ref.read(activeBgProvider.notifier).state =
        //     PlugSocketInputData.data[2].bgColor;
        RopeM.ropeColor = PlugSocketInputData.data[2].iconColor;
      } else if (x > 100 && y > 354 || x > 100 || y > 354) {
        Plugs.LP.x = Plugs.LP.posX;
        Plugs.LP.y = Plugs.LP.posY;

        if (Plugs.LP.posX == 39 && Plugs.LP.posY == 51) {
          ref.read(leftIndexProvider.notifier).state = 0;
          ref.read(colorProvider.notifier).state =
              PlugSocketInputData.data[0].iconColor;
          ref.read(borderColorProvider.notifier).state =
              PlugSocketInputData.data[0].strokeColor;
          RopeM.ropeColor = PlugSocketInputData.data[0].iconColor;
        } else if (Plugs.LP.posX == 39 && Plugs.LP.posY == 183) {
          ref.read(leftIndexProvider.notifier).state = 1;

          ref.read(colorProvider.notifier).state =
              PlugSocketInputData.data[1].iconColor;
          ref.read(borderColorProvider.notifier).state =
              PlugSocketInputData.data[1].strokeColor;
          RopeM.ropeColor = PlugSocketInputData.data[1].iconColor;
        } else {
          ref.read(leftIndexProvider.notifier).state = 2;
          ref.read(colorProvider.notifier).state =
              PlugSocketInputData.data[2].iconColor;
          ref.read(borderColorProvider.notifier).state =
              PlugSocketInputData.data[2].strokeColor;
          RopeM.ropeColor = PlugSocketInputData.data[2].iconColor;
        }
      }
    });

    ref.read(isPlugDraggedProvider.notifier).state = false;
    spring.onSpringStart();
  }
}
