import 'package:semantic_theme/src/distance/sym_semantic_distance.dart';

abstract class SemanticDistanceLibrary {
  /// From screen
  SymSemanticDistance get gutter;

  /// Between objects
  SymSemanticDistance get spacing;

  /// Within objects
  SymSemanticDistance get padding;
}