import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';

typedef void ChangeCallback(String val);
typedef void SubmitCallback(DockFieldSubmitData data);

class DockFieldSubmitData {
  final String text;

  DockFieldSubmitData({this.text});
}

class DockInputField extends StatelessWidget {
  final ChangeCallback onChange;
  final SubmitCallback onSubmit;

  final _hintText = "Add comment";

  DockInputField({this.onChange, this.onSubmit});

  final _commentTextStyle = RoofTypography.body1a;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final enabledBorder =
        OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent));
    final focusedBorder =
        OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent));
    final errorBorder = OutlineInputBorder(
        borderSide: BorderSide(color: theme.color.stroke.alert),
        borderRadius: BorderRadius.all(RoofCornerRadius.regular));

    final hintStyle = TextStyle(color: theme.color.text.placeholder);

    final textStyle =
        _commentTextStyle.textStyleWithColor(theme.color.text.primary);

    final commentBoxDecoration = InputDecoration(
        contentPadding: EdgeInsets.all(RoofDistance.c),
        hintText: _hintText,
        border: OutlineInputBorder(),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        hintStyle: hintStyle);

    //get rid of this.
    final double maxHeight = 200;

    return Row(crossAxisAlignment: CrossAxisAlignment.baseline, children: [
      Expanded(
          child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: maxHeight),
              child: TextField(
                  maxLines: null,
                  style: textStyle,
                  textInputAction: TextInputAction.done,
                  decoration: commentBoxDecoration,
                  onChanged: (String string) => onChange(string)))),
      _AnimatedSendButton(onTap: onSubmit)
    ]);
  }
}

class _AnimatedSendButton extends StatelessWidget {
  final Function onTap;
  final bool visible;

  static const double _height = 44;

  _AnimatedSendButton({this.onTap, this.visible});

  @override
  Widget build(BuildContext context) {
    final activeColor = RoofTheme.of(context).color.background.submitButton;
    final inactiveColor = activeColor.withAlpha(0);

    final sendIcon = IconReference.sendFilled;

    final activeIcon = sendIcon.buildSvg(color: activeColor);
    final inactiveIcon = sendIcon.buildSvg(color: inactiveColor);

    final padding = EdgeInsets.fromLTRB(RoofDistance.c, 0, RoofDistance.c, 0);

    return GestureDetector(
        onTap: visible ? onTap : null,
        child: Container(
            alignment: Alignment.center,
            padding: padding,
            height: _height,
            child: AnimatedCrossFade(
                firstChild: activeIcon,
                secondChild: inactiveIcon,
                duration: RoofDuration.short,
                crossFadeState: visible
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstCurve: Curves.easeIn)));
  }
}
