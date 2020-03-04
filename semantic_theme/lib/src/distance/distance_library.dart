import 'package:semantic_theme/src/distance/sym_semantic_distance.dart';

abstract class SemanticDistanceLibrary {
  /// From screen edges, between table objects.
  SemanticSymmetryDistance get gutter;

  /// Between child elements in a container object.
  SemanticSymmetryDistance get spacing;

  /// Padding between edge of container and child elements.
  SemanticSymmetryDistance get padding;
}
