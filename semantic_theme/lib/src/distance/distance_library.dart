import 'package:semantic_theme/src/distance/sym_semantic_distance.dart';

abstract class SemanticDistanceLibrary {
  /// From screen
  SemanticSymmetryDistance get gutter;

  /// Between objects
  SemanticSymmetryDistance get spacing;

  /// Within objects
  SemanticSymmetryDistance get padding;
}
