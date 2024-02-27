import 'dart:ui';

Path dashPath(
  Path path, {
  required double pathAnimationValue,
  required Intervals<double> dashArray,
}) {
  final Path newPath = Path();
  for (final PathMetric metric in path.computeMetrics()) {
    double distance =
        DashOffset.max(pathAnimationValue)._calculate(metric.length * 2);
    bool draw = true;
    while (distance < metric.length) {
      if (draw) {
        newPath.addPath(metric.extractPath(distance, distance + dashArray.next),
            Offset.zero);
      }
      distance += dashArray.next;
      draw = !draw;
    }
  }

  return newPath;
}

class DashOffset {
  /// Construtor::
  const DashOffset.max(double start) : slackLength = start;

  final double slackLength;

  double _calculate(double length) => slackLength;
}

class Intervals<T> {
  Intervals(this._values);

  final List<T> _values;
  int _index = 0;

  T get next {
    if (_index >= _values.length) _index = 0;
    return _values[_index++];
  }
}
