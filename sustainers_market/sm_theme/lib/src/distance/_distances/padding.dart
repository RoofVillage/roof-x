import 'package:semantic_theme/index.dart';

import '_distance.dart' as distance;

class SmPaddingDistance extends SemanticSymmetryDistance {
  SemanticDistance get horizontal => _Horizontal();
  SemanticDistance get vertical => _Vertical();
}

class _Horizontal extends SemanticDistance {
  double get min => distance.a;
  double get small => distance.b;
  double get medium => distance.c;
  double get large => distance.d;
  double get max => distance.e;
}

class _Vertical extends SemanticDistance {
  double get min => distance.a;
  double get small => distance.b;
  double get medium => distance.c;
  double get large => distance.d;
  double get max => distance.e;
}
