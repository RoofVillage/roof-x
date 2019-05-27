import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';
import 'package:haptics/index.dart';
import 'package:corner_radius/index.dart' as radius;
import 'package:distance/index.dart' as distance;

class LoadMoreCell extends StatefulWidget {
  final VoidCallback onTap;

  LoadMoreCell({this.onTap});

  @override
  _LoadMoreCellState createState() => _LoadMoreCellState();
}

class _LoadMoreCellState extends State<LoadMoreCell> {
  final _tapHapticOption = HapticOption.light;
  final _padding = distance.c;
  final _topMargin = distance.b;
  final _radius = radius.regular;

  bool loading = false;

  _fireHaptic() {
    if (widget.onTap != null) triggerHapticWith(_tapHapticOption);
  }

  _handleLoading() {
    // modify loading state based on tap or loading finished
    if (!loading) {
      setState(() {
        loading = true;
      });
    }
  }

  _onTap() {
    _handleLoading();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final loadMoreIcon = IconReference.loadMore.buildSvg(
      color: theme.color.icon.general,
    );

    final loadingIcon = CircularProgressIndicator();

    return GestureDetector(
      onTapDown: (details) => _fireHaptic(),
      onTap: _onTap,
      child: Container(
        margin: EdgeInsets.only(top: _topMargin),
        padding: EdgeInsets.all(_padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(_radius),
          // border: Border.all(color: theme.color.stroke.light),
          color: theme.color.background.generalPrimary,
        ),
        child: Center(
          child: loading ? loadingIcon : loadMoreIcon,
        ),
      ),
    );
  }
}
