import 'package:flutter/material.dart';
import 'package:theme/index.dart';

import 'artboard.dart';

abstract class FullScreenArtboard extends Artboard {
  Widget buildChild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final scaffold = Scaffold(
        backgroundColor: theme.color.background.general,
        body: buildChild(context));

    return RoofTheme(theme.current, child: scaffold);
  }
}
