import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:small_icon_library/index.dart';
import 'package:haptics/index.dart';
import 'package:curve/index.dart' as curve;
import 'package:duration/index.dart' as duration;
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;

class TagsWrap extends StatelessWidget {
  final List<String> tags;
  final void Function(String) tagRemoveCallback;

  TagsWrap({tags, this.tagRemoveCallback}) : this.tags = tags ?? [];

  final _wrapSpacing = distance.b;

  final _emptyText = "No tags selected";

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    List<Widget> selectedTagWidgets = [];

    selectedTagWidgets = tags
        .map(
          (tag) => _RemoveableAnimatedTag(
            key: ObjectKey(tag),
            label: tag,
            removeCallback: () => tagRemoveCallback(tag),
          ),
        )
        .toList();

    final emptyText = Text(
      _emptyText,
      style: typography.heading2.textStyleWithColor(theme.color.text.secondary),
    );

    return Container(
      margin: EdgeInsets.only(bottom: distance.c),
      child: tags.isNotEmpty
          ? Wrap(
              children: selectedTagWidgets,
              runSpacing: _wrapSpacing,
              spacing: _wrapSpacing,
            )
          : emptyText,
    );
  }
}

class _RemoveableAnimatedTag extends StatefulWidget {
  final String label;
  final VoidCallback removeCallback;

  _RemoveableAnimatedTag({
    Key key,
    this.label,
    this.removeCallback,
  }) : super(key: key);

  @override
  _RemoveableAnimatedTagState createState() => _RemoveableAnimatedTagState();
}

class _RemoveableAnimatedTagState extends State<_RemoveableAnimatedTag>
    with SingleTickerProviderStateMixin {
  bool _show = true;

  _remove() {
    triggerHapticWith(HapticOption.light);

    setState(() => _show = false);
    Future.delayed(duration.short, () {
      widget.removeCallback();
    });
  }

  final _typographyStyle = typography.detailSecondary;
  final double _height = 40;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final removeIcon = SmallIcon.x.buildWidget(
      color: theme.color.icon.general,
    );

    final textWidget = Text(
      widget.label,
      style: _typographyStyle.textStyleWithColor(theme.color.text.primary),
    );

    final backgroundColor = theme.color.background.generalPrimary;

    final animatedTextContainer = AnimatedSize(
      vsync: this,
      curve: curve.quick,
      duration: duration.short,
      alignment: Alignment.topLeft,
      child: Container(
        width: _show ? null : 0,
        child: textWidget,
      ),
    );

    final List<Widget> children = [];

    if (_show) children.add(removeIcon);
    children.add(animatedTextContainer);

    final animatedOpacityContainer = AnimatedOpacity(
      opacity: _show ? 1 : 0,
      curve: curve.quick,
      duration: duration.short,
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );

    return GestureDetector(
      onTap: _remove,
      child: Container(
        padding: _show
            ? EdgeInsets.only(
                left: distance.a,
                right: distance.b,
              )
            : EdgeInsets.all(0),
        height: _height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(_height / 2),
          ),
        ),
        child: animatedOpacityContainer,
      ),
    );
  }
}
