import 'package:semantic_theme/src/distance/sym_semantic_distance.dart';

abstract class DistanceLibrary {
  SymSemanticDistance get gutter;
  SymSemanticDistance get spacing;
  SymSemanticDistance get padding;
}