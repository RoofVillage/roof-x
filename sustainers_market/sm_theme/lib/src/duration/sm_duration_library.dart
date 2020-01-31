import 'package:semantic_theme/index.dart';

class SmDurationLibrary extends SemanticDurationLibrary {
  @override
  Duration get short => Duration(milliseconds: 120);

  @override
  Duration get medium => Duration(milliseconds: 180);

  @override
  Duration get long => Duration(milliseconds: 360);
}
