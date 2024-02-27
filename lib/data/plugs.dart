// ignore_for_file: non_constant_identifier_names

import 'package:animated_home_app/utils/enums.dart';
import '../model/plug.dart';

final List<Plug> plugs = [
  Plug(
      type: PlugType.input,
      width: 42.0,
      height: 42.0,
      x: 39,
      y: 51,
      posX: 39,
      posY: 51),
  Plug(
    width: 42.0,
    height: 42.0,
    type: PlugType.output,
  ),
];

class Plugs {
  static var LP = plugs[0];
  static var RP = plugs[1];
}
