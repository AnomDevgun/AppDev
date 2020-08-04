import 'dart:math';

class BFatBrain {
  double logBase(num x, num base) => log(x) / log(base);
  BFatBrain(
      {this.weight, this.height, this.hip, this.neck, this.unit, this.waist});

  final int height;
  final int weight;
  final int unit;
  final int hip;
  final int neck;
  final int waist;
  double _bFat;

  // ignore: non_constant_identifier_names
  String Calculate() {
    if (unit == 1) {
      _bFat = 495 /
              (1.0324 -
                  0.19077 * logBase((waist - neck), 10) +
                  0.15456 * logBase(height, 10)) -
          450;
      return _bFat.toStringAsFixed(1);
    } else {
      _bFat = 495 /
              (1.29579 -
                  0.35004 *
                      logBase(
                          ((waist * 2.54) + (hip * 2.54) - (neck * 2.54)), 10) +
                  0.22100 * logBase((height * 2.54), 10)) -
          450;
      return _bFat.toStringAsFixed(1);
    }
  }
}
