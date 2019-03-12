import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';

typedef void ChangeCallback(bool val);
typedef void SubmitCallback(DockFieldSubmitData data);

class DockFieldSubmitData {
  final String text;

  DockFieldSubmitData({this.text});
}

class DockInputField extends StatefulWidget {
  final ChangeCallback onInputChange;
  final SubmitCallback onSubmit;
  final double baseHeight;

  DockInputField({this.onInputChange, this.onSubmit, this.baseHeight});

  _DockInputFieldState createState() => _DockInputFieldState();
}

class _DockInputFieldState extends State<DockInputField> {
  bool _inputHasText = false;

  static const String _hintText = "Add comment";
  static const double _maxHeight = 200;

  final _commentTextStyle = RoofTypography.bodyPrimary;
  final _controller = TextEditingController();

  _textChanged() {
    widget.onInputChange(_controller.text.isNotEmpty);
    if (_controller.text.isNotEmpty && !_inputHasText) {
      setState(() {
        _inputHasText = true;
      });
    } else if (_controller.text.isEmpty && _inputHasText) {
      setState(() {
        _inputHasText = false;
      });
    }
  }

  _submit() {
    widget.onSubmit(DockFieldSubmitData(text: _controller.text));
  }

  @override
  void initState() {
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
      borderRadius: BorderRadius.all(RoofCornerRadius.regular),
    );

    final hintStyle = TextStyle(color: theme.color.text.placeholder);

    final textStyle =
        _commentTextStyle.textStyleWithColor(theme.color.text.primary);

    final textFieldDecoration = InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(
          0, RoofDistance.c, RoofDistance.c, RoofDistance.c),
      hintText: _hintText,
      border: OutlineInputBorder(),
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
      errorBorder: errorBorder,
      hintStyle: hintStyle,
    );

    final textField = TextField(
      maxLines: null,
      style: textStyle,
      textInputAction: TextInputAction.done,
      decoration: textFieldDecoration,
      controller: _controller,
    );

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
          _SubmitButton(
            onTap: _submit,
            height: widget.baseHeight,
            visible: _inputHasText,
          ),
        ],
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final Function onTap;
  final double height;
  final bool visible;

  _SubmitButton({this.onTap, this.height, this.visible: false});

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
            height: height,
            width: visible? null : 0,
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
