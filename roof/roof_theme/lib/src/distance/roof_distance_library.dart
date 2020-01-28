import 'package:semantic_theme/index.dart';
import 'package:roof_theme/src/distance/_distances/gutter.dart';
import 'package:roof_theme/src/distance/_distances/padding.dart';
import 'package:roof_theme/src/distance/_distances/spacing.dart';

class RoofDistanceLibrary extends SemanticDistanceLibrary {
  @override
  SemanticSymmetryDistance get gutter => RoofGutterDistance();

  @override
  SemanticSymmetryDistance get padding => RoofPaddingDistance();

  @override
  SemanticSymmetryDistance get spacing => RoofSpacingDistance();
}
