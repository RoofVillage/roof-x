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

    final hintStyle = _commentTextStyle.textStyleWithColor(
      theme.color.text.placeholder,
    );
    final textStyle = _commentTextStyle.textStyleWithColor(
      theme.color.text.primary,
    );

    final textFieldDecoration = InputDecoration(
      contentPadding: EdgeInsets.all(0),
      hintText: _hintText,
      border: OutlineInputBorder(),
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
      hintStyle: hintStyle,
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
      padding: _inputHasText ? paddingWithBuffer : paddingWithoutBuffer,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: textField),
        ],
      ),
    );

    final submitButton = _SubmitButton(
      onTap: _submit,
      height: widget.baseHeight,
      visible: _inputHasText,
    );

    final constrainedInputStack = ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: _maxHeight,
        minHeight: widget.baseHeight,
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
