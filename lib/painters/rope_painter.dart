// ignore_for_file: non_constant_identifier_names
import 'package:animated_home_app/model/rope_color.dart';
import 'package:flutter/material.dart';
import '../data/plugs.dart';
import '../utils/rope_utils.dart';
import 'dashed_path.dart';

class RopePainter extends CustomPainter {
  final bool isDrag;
  final double pathAnimationValue;
  final double springValX;
  final double springValY;

  RopePainter({
    required this.isDrag,
    required this.pathAnimationValue,
    required this.springValX,
    required this.springValY,
  });

  //Plugs
  final LP = Plugs.LP;
  final RP = Plugs.RP;

  @override
  void paint(Canvas canvas, Size size) {
    ///
    canvas.clipRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));

    final Path path = Path();
    final RopeUtils util = RopeUtils();
    const greyColor = Color(0xFF747C8E);

    final Paint ropePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..color = isDrag ? greyColor : RopeM.ropeColor;

    final Paint blurPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeJoin = StrokeJoin.round
      ..color = Colors.white
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 9.0);

    final Paint shadowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeJoin = StrokeJoin.round
      ..color = Colors.black12
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.0);

    final dashPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.2
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..color = Colors.white;

    //This centers the rope start to the plug.
    double p1x = LP.x + (LP.width / 2);
    double p1y = LP.y + (LP.height / 2);

    //This centers the rope start to the plug.
    double p2x = RP.x + (RP.width / 2);
    double p2y = RP.y + (RP.height / 2);

    path.moveTo(p1x, p1y);
    path.quadraticBezierTo(
        util.anchor().x + springValX, util.anchor().y + springValY, p2x, p2y);

    canvas.drawPath(path, blurPaint);
    canvas.drawPath(path, ropePaint);
    canvas.drawPath(
      dashPath(path,
          pathAnimationValue: pathAnimationValue,
          dashArray: Intervals([10.0, 10.0])),
      dashPaint,
    );

    //Shadow has its own properties because the whole path is shifted vertically
    //by 12 units.
    path.moveTo(p1x, p1y + 12);
    path.quadraticBezierTo(util.anchor().x + springValX,
        util.anchor().y + 12 + springValY, p2x, p2y + 12);
    canvas.drawPath(path, shadowPaint);
  }

  @override
  bool shouldRepaint(RopePainter oldDelegate) => true;
}
