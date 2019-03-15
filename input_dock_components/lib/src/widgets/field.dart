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

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _textController.addListener(textChanged);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _dock = RoofInputDock.of(context);
    super.didChangeDependencies();
  }

  textChanged() {
    _dock.setText(_textController.text);
  }

  @override
  Widget build(BuildContext context) {
    final paddedTextField = _TextFieldComponent(
      dock: _dock,
      controller: _textController,
    );

    final submitButton = _SubmitButton(
      onSubmit: _dock.onSubmit,
      height: _dock.baseHeight,
      visible: _dock.showSubmitButton,
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
  final VoidCallback onSubmit;
  final double height;
  final bool visible;

  _SubmitButton({this.onSubmit, this.height, this.visible: false});

  @override
  Widget build(BuildContext context) {
    final iconColor = RoofTheme.of(context).color.background.submitButton;
    final sendIcon = IconReference.sendFilled.buildSvg(color: iconColor);

    final padding = EdgeInsets.symmetric(horizontal: RoofDistance.c);

    onTap() {
      Haptic.triggerWith(HapticOption.light);
      onSubmit();
    }

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
