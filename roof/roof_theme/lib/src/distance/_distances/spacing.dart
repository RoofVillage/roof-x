import 'package:semantic_theme/index.dart';

import '_distance.dart' as distance;

class RoofSpacingDistance extends SemanticSymmetryDistance {
  SemanticDistance get horizontal => _Horizontal();
  SemanticDistance get vertical => _Vertical();
}

class _Horizontal extends SemanticDistance {
  double get min => distance.a;
  double get small => distance.b;
  double get medium => distance.c;
  double get large => distance.e;
  double get max => distance.g;
}

class _Vertical extends SemanticDistance {
  double get min => distance.a;
  double get small => distance.b;
  double get medium => distance.c;
  double get large => distance.e;
  double get max => distance.f;
}
