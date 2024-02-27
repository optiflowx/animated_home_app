// ignore_for_file: non_constant_identifier_names, unnecessary_getters_setters

import 'dart:math' as math;
import 'dart:ui';
import '../data/plug_socket_input_data.dart';
import '../data/plugs.dart';
import '../model/plug.dart';

class RopeUtils {
  final double slackLength = 400;
  static Color ropeColor = PlugSocketInputData.data[0].iconColor;

  final Plug LP = Plugs.LP;
  final Plug RP = Plugs.RP;

  double distance() {
    return slackLength -
        math.sqrt(math.pow((LP.x - RP.x), 2) + math.pow((LP.y - RP.y), 2));
  }

  double slack() {
    final d = slackLength -
        math.sqrt(math.pow((LP.x - RP.x), 2) + math.pow((LP.y - RP.y), 2));
    return math.max(math.min(slackLength, d), 0.0);
  }

  double midY() => (LP.y + RP.y) / 2;
  double midX() => (LP.x + RP.x) / 2;

  math.Point<double> anchor() {
    return math.Point(midX(), (midY()) + slack());
  }
}
