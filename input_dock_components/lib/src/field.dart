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

class DockInputField extends StatefulWidget {
  final ChangeCallback onChange;
  final SubmitCallback onSubmit;

  DockInputField({this.onChange, this.onSubmit});

  _DockInputFieldState createState() => _DockInputFieldState();
}

class _DockInputFieldState extends State<DockInputField> {
  bool _showSendButton = false;

  static const String _hintText = "Add comment";
  static const double _maxHeight = 200;

  final _commentTextStyle = RoofTypography.bodyPrimary;
  final _controller = TextEditingController();

  _textChanged() {
    widget.onChange(_controller.text);
    if (_controller.text.isNotEmpty && !_showSendButton) {
      setState(() {
        _showSendButton = true;
      });
    } else if (_controller.text.isEmpty && _showSendButton) {
      setState(() {
        _showSendButton = false;
      });
    }
  }

  @override
  void initState() {
    print("initState");
    _controller.addListener(_textChanged);
    super.initState();
  }

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

    final textFieldDecoration = InputDecoration(
        contentPadding: EdgeInsets.all(RoofDistance.c),
        hintText: _hintText,
        border: OutlineInputBorder(),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        hintStyle: hintStyle);

    final textField = TextField(
        maxLines: null,
        style: textStyle,
        textInputAction: TextInputAction.done,
        decoration: textFieldDecoration,
        controller: _controller);

    return Flexible(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: _maxHeight),
              child: textField,
            ),
          ),
          _SendButton(
            onTap: widget.onSubmit,
            visible: _showSendButton,
          ),
        ],
      ),
    );
  }
}

class _SendButton extends StatelessWidget {
  final Function onTap;
  final bool visible;

  static const double _height = 44;

  _SendButton({this.onTap, this.visible: false});

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
                firstCurve: RoofCurve.quick)));
  }
}