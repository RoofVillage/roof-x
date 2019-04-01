import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';
import 'package:haptics/index.dart';

import 'input_dock.dart';

class DockInputField extends StatefulWidget {
  final Function onSubmit;

  DockInputField({@required this.onSubmit});

  @override
  _DockInputFieldState createState() => _DockInputFieldState();
}

class _DockInputFieldState extends State<DockInputField> {
  static const double _maxHeight = 200;
  static const int _maxCharCount = 750;
  static const int _charShowCount = 720;

  final _textController = TextEditingController();

  InheritedInputDock _dock;

  _textChanged() {
    _dock.text = _textController.text;
    RoofInputDock.of(context, shouldRebuild: false).text = _textController.text;
  }

  _resetText() {
    RoofInputDock.of(context, shouldRebuild: false).text = _textController.text;
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
  Widget build(BuildContext context) {
    final paddedTextField = _TextFieldComponent(
      dock: _dock,
      controller: _textController,
      charShowCount: _charShowCount,
      maxCharCount: _maxCharCount,
    );

    final submitButton = _SubmitButton(
      submitCallback: _onSubmit,
      canSubmit: _textController.text.length <= _maxCharCount,
    );

    final constrainedInputStack = ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: _maxHeight,
        minHeight: _dock.baseHeight,
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        fit: StackFit.passthrough,
        children: [paddedTextField, submitButton],
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

  void _onSubmit() {
    _resetText();
    widget.onSubmit(_textController.text);
  }
}

class _TextFieldComponent extends StatelessWidget {
  final InheritedInputDock dock;
  final TextEditingController controller;
  final int charShowCount;
  final int maxCharCount;

  _TextFieldComponent(
      {this.dock, this.controller, this.charShowCount, this.maxCharCount});

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
    final paddingWithBuffer = EdgeInsets.only(right: submitButtonPaddingBuffer);
    final paddingWithoutBuffer = EdgeInsets.all(0);

    return Padding(
      padding: dock.showSubmitButton ? paddingWithBuffer : paddingWithoutBuffer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: textField),
          _TextCounter(
            charCount: controller.text.length,
            charShowCount: charShowCount,
            charMaxCount: maxCharCount,
          )
        ],
      ),
    );
  }
}

class _TextCounter extends StatelessWidget {
  final int charCount;
  final int charShowCount;
  final int charMaxCount;

  _TextCounter({Key key, this.charCount, this.charShowCount, this.charMaxCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final bool showTextCounter = charCount > charShowCount;
    final bool showAlert = charCount > charMaxCount;

    final textCounterStyle = RoofTypography.detailSecondary.textStyleWithColor(
      showAlert ? theme.color.text.alert : theme.color.text.placeholder,
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: RoofDistance.a),
      height: showTextCounter ? null : 0,
      child: Text(
        showTextCounter ? "$charCount/$charMaxCount" : "",
        style: textCounterStyle,
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final VoidCallback submitCallback;
  final bool canSubmit;

  _SubmitButton({this.submitCallback, this.canSubmit});

  @override
  Widget build(BuildContext context) {
    final dock = RoofInputDock.of(context);
    final theme = RoofTheme.of(context);

    final activeIconColor = theme.color.background.submitButton;
    final inactiveIconColor = theme.color.background.inactiveButton;
    final sendIcon = IconReference.sendFilled;
    final activeSendIcon = sendIcon.buildSvg(color: activeIconColor);
    final inactiveSendIcon = sendIcon.buildSvg(color: inactiveIconColor);

    final animatedSubmitButton = AnimatedCrossFade(
      duration: RoofDuration.short,
      firstCurve: RoofCurve.easy,
      secondCurve: RoofCurve.quick,
      crossFadeState:
          canSubmit ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: activeSendIcon,
      secondChild: inactiveSendIcon,
    );

    void onTap() {
      triggerHapticWith(HapticOption.light);
      submitCallback();
    }

    void inactiveTap() {
      triggerHapticWith(HapticOption.click);
    }

    final tapAction = dock.showSubmitButton && canSubmit ? onTap : null;

    final tapDownAction =
        dock.showSubmitButton && !canSubmit ? (details) => inactiveTap() : null;

    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: RoofDistance.c),
      height: dock.baseHeight,
      child: AnimatedOpacity(
        opacity: dock.showSubmitButton ? 1 : 0,
        duration: RoofDuration.short,
        curve: RoofCurve.easy,
        child: GestureDetector(
            onTap: tapAction,
            onTapDown: tapDownAction,
            child: animatedSubmitButton),
      ),
    );
  }
}
