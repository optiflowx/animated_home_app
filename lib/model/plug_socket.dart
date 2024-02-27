import 'package:flutter/widgets.dart';

class PlugSocket {
  IconData icon;
  Color bgColor;
  Color iconColor;
  Color strokeColor;
  Color fillColor;
  Color? unplugColor, unplugStrokeColor, unplugIconColor;

  PlugSocket({
    required this.icon,
    required this.bgColor,
    required this.iconColor,
    required this.strokeColor,
    required this.fillColor,
    this.unplugColor,
    this.unplugStrokeColor,
    this.unplugIconColor,
  });
}
