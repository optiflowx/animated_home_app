import 'package:animated_home_app/model/plug_socket.dart';
import 'package:flutter/cupertino.dart';

class PlugSocketInputData {
  static List<PlugSocket> data = [
    PlugSocket(
      icon: CupertinoIcons.drop_fill,
      bgColor: const Color.fromARGB(255, 110, 167, 249),
      strokeColor: const Color.fromARGB(255, 39, 93, 223),
      fillColor: const Color.fromARGB(255, 28, 69, 195),
      iconColor: const Color.fromARGB(255, 39, 103, 253),
      unplugColor: const Color.fromARGB(255, 167, 167, 174),
      unplugIconColor: const Color.fromARGB(255, 116, 124, 142),
      unplugStrokeColor: const Color.fromARGB(255, 116, 114, 122),
    ),
    PlugSocket(
      icon: CupertinoIcons.flame_fill,
      bgColor: const Color.fromARGB(255, 235, 126, 140),
      strokeColor: const Color.fromARGB(255, 213, 57, 42),
      fillColor: const Color.fromARGB(255, 191, 105, 38),
      iconColor: const Color.fromARGB(255, 213, 90, 72),
      unplugColor: const Color.fromARGB(255, 167, 167, 174),
      unplugIconColor: const Color.fromARGB(255, 116, 124, 142),
      unplugStrokeColor: const Color.fromARGB(255, 116, 114, 122),
    ),
    PlugSocket(
      icon: CupertinoIcons.bolt_fill,
      bgColor: const Color.fromARGB(255, 240, 188, 111),
      strokeColor: const Color.fromARGB(255, 216, 129, 47),
      fillColor: const Color.fromARGB(255, 191, 105, 38),
      iconColor: const Color.fromARGB(255, 216, 149, 67),
      unplugColor: const Color.fromARGB(255, 167, 167, 174),
      unplugIconColor: const Color.fromARGB(255, 116, 124, 142),
      unplugStrokeColor: const Color.fromARGB(255, 116, 114, 122),
    ),
  ];
}
