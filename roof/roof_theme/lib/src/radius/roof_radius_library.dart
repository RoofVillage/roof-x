import 'dart:ui';

import 'package:semantic_theme/index.dart';

class RoofRadiusLibrary extends SemanticRadiusLibrary {
  @override
  Radius get min => Radius.circular(2);

  @override
  Radius get small => Radius.circular(4);

  @override
  Radius get medium => Radius.circular(6);

  @override
  Radius get large => Radius.circular(12);

  @override
  Radius get max => Radius.circular(20);
}
