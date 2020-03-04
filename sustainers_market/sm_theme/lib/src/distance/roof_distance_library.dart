import 'package:semantic_theme/index.dart';
import 'package:sm_theme/src/distance/_distances/gutter.dart';
import 'package:sm_theme/src/distance/_distances/padding.dart';
import 'package:sm_theme/src/distance/_distances/spacing.dart';

class SmDistanceLibrary extends SemanticDistanceLibrary {
  @override
  SemanticSymmetryDistance get gutter => SmGutterDistance();

  @override
  SemanticSymmetryDistance get padding => SmPaddingDistance();

  @override
  SemanticSymmetryDistance get spacing => SmSpacingDistance();
}
