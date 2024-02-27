import 'package:animated_home_app/utils/provs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/plugs.dart';
import '../helpers/spring.dart';

class RightPlug extends ConsumerStatefulWidget {
  const RightPlug({super.key});

  @override
  ConsumerState<RightPlug> createState() => _RightPlugState();
}

class _RightPlugState extends ConsumerState<RightPlug>
    with TickerProviderStateMixin {
  double x = 0.0, y = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final w = MediaQuery.of(context).size.width;

    Plugs.RP.x = (w * 0.73);
    Plugs.RP.y = 183.0;
    Plugs.RP.posX = (w * 0.73);
    Plugs.RP.posY = 183.0;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final color = ref.watch(colorProvider);
    final isDrag = ref.watch(isPlugDraggedProvider);
    const greyColor = Color(0xFF747C8E);
    const strokeGColor = Color(0xFF74727A);
    final borderColor = ref.watch(borderColorProvider);

    return Positioned(
      left: Plugs.RP.x,
      top: Plugs.RP.y,
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

  void onPanStart(DragStartDetails d) {
    ref.read(isPlugDraggedProvider.notifier).state = true;
    // spring.onSpringEnd();
  }

  void onPanUpdate(DragUpdateDetails details) {
    ///To the current values of [Plugs.RP.x && Plugs.RP.y]
    ///We add the delta dx & dy, respectively;
    setState(() {
      Plugs.RP.x += details.delta.dx;
      Plugs.RP.y += details.delta.dy;
    });

    x = Plugs.RP.x; //Checking variables
    y = Plugs.RP.y; //Checking variables
  }

  void onPanEnd(DragEndDetails details) {
    final posX = MediaQuery.of(context).size.width * 0.73;
    final Spring spring = Spring(ref: ref, tickerProvider: this);

    setState(() {
      if (y >= 0 && y <= 90 && x >= (posX - 39) && x <= (posX + 39)) {
        Plugs.RP.x = posX;
        Plugs.RP.posX = posX;
        Plugs.RP.y = 51.0;
        Plugs.RP.posY = 51.0;
        ref.read(rightIndexProvider.notifier).state = 0;
      } else if (y >= 146 && y <= 221 && x >= (posX - 39) && x <= (posX + 39)) {
        Plugs.RP.x = posX;
        Plugs.RP.posX = posX;
        Plugs.RP.y = 183.0;
        Plugs.RP.posY = 183.0;
        ref.read(rightIndexProvider.notifier).state = 1;
      } else if (y >= 278 && y <= 354 && x >= (posX - 39) && x <= (posX + 39)) {
        Plugs.RP.x = posX;
        Plugs.RP.posX = posX;
        Plugs.RP.y = 315.0;
        Plugs.RP.posY = 315.0;
        ref.read(rightIndexProvider.notifier).state = 2;
      } else if (y > 315 && x < (posX - 39) || x < (posX - 39) || y > 315) {
        Plugs.RP.x = Plugs.RP.posX;
        Plugs.RP.y = Plugs.RP.posY;
      }
    });

    ref.read(isPlugDraggedProvider.notifier).state = false;
    spring.onSpringStart();
  }
}
