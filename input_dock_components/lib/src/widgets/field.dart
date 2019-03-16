import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';
import 'package:haptics/index.dart';

import '../input_dock.dart';

class DockInputField extends StatefulWidget {
  @override
  _DockInputFieldState createState() => _DockInputFieldState();
}

class _DockInputFieldState extends State<DockInputField> {
  static const double _maxHeight = 200;

  final _textController = TextEditingController();

  InheritedInputDock _dock;

  _textChanged() {
    _dock.setText(_textController.text);
  }

  _resetText() {
    _textController.text = "";
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _textController.addListener(_textChanged);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _dock = RoofInputDock.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final paddedTextField = _TextFieldComponent(
      dock: _dock,
      controller: _textController,
    );

    final constrainedInputStack = ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: _maxHeight,
        minHeight: _dock.baseHeight,
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        fit: StackFit.passthrough,
        children: [
          paddedTextField,
          _SubmitButton(submitCallback: _resetText),
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

class _TextFieldComponent extends StatelessWidget {
  final InheritedInputDock dock;
  final TextEditingController controller;

  _TextFieldComponent({this.dock, this.controller});

  static const String _hintText = "Add comment";

  final _commentTextStyle = RoofTypography.bodyPrimary;

  final _enabledBorder =
      OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent));
  final _focusedBorder =
      OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent));

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

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
      controller: controller,
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

    return Padding(
      padding: dock.showSubmitButton ? paddingWithBuffer : paddingWithoutBuffer,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: textField),
        ],
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final VoidCallback submitCallback;

  _SubmitButton({this.submitCallback});

  @override
  Widget build(BuildContext context) {
    final dock = RoofInputDock.of(context);

    final iconColor = RoofTheme.of(context).color.background.submitButton;
    final sendIcon = IconReference.sendFilled.buildSvg(color: iconColor);

    onTap() {
      Haptic.triggerWith(HapticOption.light);
      dock.onSubmit();
      submitCallback();
    }

    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: RoofDistance.c),
      height: dock.baseHeight,
      child: AnimatedOpacity(
        opacity: dock.showSubmitButton ? 1 : 0,
        duration: RoofDuration.short,
        curve: RoofCurve.easy,
        child: GestureDetector(
          onTap: dock.showSubmitButton ? onTap : null,
          child: sendIcon,
        ),
      ),
    );
  }
}
