import 'package:flutter/material.dart';

import '../_utils/theme_option_aware.dart';

abstract class ShadowLibrary implements ThemeOptionDependent {
  BoxShadow get small;
  BoxShadow medium;
  BoxShadow get large;
}
