import 'package:semantic_theme/index.dart';

class RoofDurationLibrary extends SemanticDurationLibrary {
  @override
  Duration get short => Duration(milliseconds: 80);

  @override
  Duration get medium => Duration(milliseconds: 160);

  @override
  Duration get long => Duration(milliseconds: 320);
}
