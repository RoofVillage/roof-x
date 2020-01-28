import 'dart:ui';

import 'package:semantic_theme/index.dart';

class SmRadiusLibrary extends SemanticRadiusLibrary {
  @override
  Radius get min => Radius.circular(2);

  @override
  Radius get small => Radius.circular(6);

  @override
  Radius get medium => Radius.circular(12);

  @override
  Radius get large => Radius.circular(18);

  @override
  Radius get max => Radius.circular(22);
}
