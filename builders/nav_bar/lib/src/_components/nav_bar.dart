import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:semantic_theme/index.dart';

mixin NavBar implements StatelessWidget {
  List<Widget> get actionButtons;
  List<Widget> buildNavigationWidgets(BuildContext context);

  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    SystemChrome.setSystemUIOverlayStyle(
      theme.systemUiStyle.systemUiOverlayStyle.value,
    );

    final itemRow = Center(
      child: Column(
        // Stretch the cards in horizontal axis
        crossAxisAlignment: CrossAxisAlignment.stretch,

        ///Pushes sub-layout to the bottom.
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildNavigationWidgets(context),
              ),
              Row(children: actionButtons),
            ],
          ),
        ],
      ),
    );

    final safeAreaTop = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.fromLTRB(
        theme.distance.padding.horizontal.min,
        theme.distance.padding.vertical.min + safeAreaTop,
        theme.distance.padding.horizontal.min,
        theme.distance.padding.vertical.min,
      ),
      decoration: BoxDecoration(
        color: theme.color.background.inputForeground,
      ),
      child: itemRow,
    );
  }
}
