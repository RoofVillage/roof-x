import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:stream/index.dart';
import 'package:icon_library/index.dart';

import '_bloc.dart';
import '_widget.dart';

class PublicActivity extends StatelessWidget {
  Widget build(BuildContext context) {
    return RoofScaffoldA(
      body: BlocProvider(
        bloc: Bloc(),
        child: RootWidget(),
      ),
      rightButtonIconReference: IconReference.info,
      centerIconReference: IconReference.logoFull,
      rightButtonAction: () {
        final theme = RoofTheme.of(context);
        switch (theme.current) {
          case RoofThemeOption.dark:
            theme.use(RoofThemeOption.light);
            break;
          case RoofThemeOption.light:
            theme.use(RoofThemeOption.dark);
            break;
        }
      },
    );
  }
}
