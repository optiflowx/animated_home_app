import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorProvider = StateProvider<Color>((ref) {
  return const Color.fromARGB(255, 39, 103, 253);
});

final containerColorProvider = StateProvider<Color>((ref) {
  return const Color.fromARGB(255, 110, 167, 249);
});

final borderColorProvider = StateProvider<Color>((ref) {
  return const Color.fromARGB(255, 39, 93, 223);
});

final leftIndexProvider = StateProvider<int>((ref) => 0);

final rightIndexProvider = StateProvider<int>((ref) => 1);

final isPlugDraggedProvider = StateProvider<bool>((ref) => false);

final springValueYProvider = StateProvider<double>((ref) => 0.0);

final springValueXProvider = StateProvider<double>((ref) => 0.0);

final velocityProvider = StateProvider<Offset>((ref) => Offset.zero);
