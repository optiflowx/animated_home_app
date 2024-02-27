import '../utils/enums.dart';

class Plug {
  double x,y;
  double posX, posY;
  PlugType type;
  double height, width;

  Plug({
    this.y = 0.0,
    this.x = 0.0,
    this.posX = 0.0,
    this.posY = 0.0,
    required this.type,
    required this.width,
    required this.height,
  });
}
