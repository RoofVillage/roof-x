import 'package:semantic_theme/index.dart';
import 'package:theme/src/distance/_distances/gutter.dart';
import 'package:theme/src/distance/_distances/padding.dart';
import 'package:theme/src/distance/_distances/spacing.dart';

class RoofDistanceLibrary extends SemanticDistanceLibrary {
  @override
  SymSemanticDistance get gutter => RoofGutterDistance();

  @override
  SymSemanticDistance get padding => RoofPaddingDistance();

  @override
  SymSemanticDistance get spacing => RoofSpacingDistance();
}
