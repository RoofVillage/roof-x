import 'package:semantic_theme/index.dart';

class RoofDurationLibrary extends SemanticDurationLibrary {
  @override
  Duration get short => Duration(milliseconds: 180);

  @override
  Duration get medium => Duration(milliseconds: 360);

  @override
  Duration get long => Duration(milliseconds: 540);
}
