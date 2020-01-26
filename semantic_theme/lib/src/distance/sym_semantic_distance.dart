import 'package:semantic_theme/src/distance/semantic_distance.dart';

abstract class SemanticSymmetryDistance {
  SemanticDistance get vertical;
  SemanticDistance get horizontal;
}