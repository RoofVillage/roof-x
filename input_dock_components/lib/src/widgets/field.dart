import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';

import '../input_dock.dart';

class DockInputField extends StatefulWidget {
  _DockInputFieldState createState() => _DockInputFieldState();
}

class _DockInputFieldState extends State<DockInputField> {
  static const String _hintText = "Add comment";
  static const double _maxHeight = 200;

  final _commentTextStyle = RoofTypography.bodyPrimary;
  final _controller = TextEditingController();

  final _enabledBorder =
      OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent));
  final _focusedBorder =
      OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent));

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final dock = RoofInputDock.of(context);

    textChanged() {
      dock.setText(_controller.text);
    }

    _controller.addListener(textChanged);

    final hintStyle = _commentTextStyle.textStyleWithColor(
      theme.color.text.placeholder,
    );
    final textStyle = _commentTextStyle.textStyleWithColor(
      theme.color.text.primary,
    );

    final textFieldDecoration = InputDecoration(
      contentPadding: EdgeInsets.all(0),
      hintText: _hintText,
      hintStyle: hintStyle,
      border: OutlineInputBorder(),
      enabledBorder: _enabledBorder,
      focusedBorder: _focusedBorder,
    );

    final textField = TextField(
      maxLines: null,
      style: textStyle,
      textInputAction: TextInputAction.done,
      decoration: textFieldDecoration,
      controller: _controller,
    );

    final double submitButtonPaddingBuffer = 50;
    final paddingWithBuffer = EdgeInsets.fromLTRB(
      0,
      RoofDistance.a,
      submitButtonPaddingBuffer,
      RoofDistance.a,
    );
    final paddingWithoutBuffer = EdgeInsets.symmetric(
      vertical: RoofDistance.a,
    );

    final paddedTextField = Padding(
      padding: dock.showSubmitButton ? paddingWithBuffer : paddingWithoutBuffer,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: textField),
        ],
      ),
    );

    final submitButton = _SubmitButton(
      onTap: dock.onSubmit,
      height: dock.baseHeight,
      visible: dock.showSubmitButton,
    );

    final constrainedInputStack = ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: _maxHeight,
        minHeight: dock.baseHeight,
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        fit: StackFit.passthrough,
        children: [
          paddedTextField,
          submitButton,
        ],
      ),
    );

    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: constrainedInputStack),
        ],
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final VoidCallback onTap;
  final double height;
  final bool visible;

  _SubmitButton({this.onTap, this.height, this.visible: false});

  @override
  Widget build(BuildContext context) {
    final iconColor = RoofTheme.of(context).color.background.submitButton;
    final sendIcon = IconReference.sendFilled.buildSvg(color: iconColor);

    final padding = EdgeInsets.symmetric(horizontal: RoofDistance.c);

    return GestureDetector(
      onTap: visible ? onTap : null,
      child: Container(
        alignment: Alignment.centerRight,
        padding: padding,
        height: height,
        width: height,
        child: AnimatedOpacity(
          opacity: visible ? 1 : 0,
          duration: RoofDuration.short,
          curve: RoofCurve.quick,
          child: sendIcon,
        ),
      ),
    );
  }
}
