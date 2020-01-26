import 'package:flutter/material.dart';
import 'package:labeled_value/index.dart';
import 'package:haptics/index.dart';
import 'package:semantic_theme/index.dart';

import '_components/roller_column_body.dart';

class RollerColumn<T> extends StatefulWidget {
  final LabeledValue<T> selectedValue;
  final List<LabeledValue<T>> list;
  final void Function(LabeledValue<T>) onChange;
  final bool canRollover;
  final int optionsVisible;
  final CrossAxisAlignment crossAxisAlignment;

  RollerColumn({
    this.selectedValue,
    this.list,
    this.onChange,
    this.canRollover,
    this.optionsVisible,
    this.crossAxisAlignment,
  });

  @override
  _RollerColumnState<T> createState() => _RollerColumnState<T>();
}

class _RollerColumnState<T> extends State<RollerColumn<T>> {
  final double _stepHeight = 40;

  int _stepsVisible;
  double _boundaryOffset;
  ScrollController _scrollController;
  bool _canRollover;
  LabeledValue<T> _selectedValue;

  @override
  void initState() {
    _stepsVisible = widget.optionsVisible ?? 5;
    _boundaryOffset = _stepHeight * (_stepsVisible - 1) / 2;

    _selectedValue = widget.selectedValue ?? widget.list.first;

    if (widget.list.length < _stepsVisible) {
      _canRollover = false;
    } else {
      _canRollover = widget.canRollover ?? true;
    }

    double initialOffset = _stepHeight *
        widget.list
            .map((option) => option.value)
            .toList()
            .indexOf(_selectedValue.value);

    if (_canRollover) {
      initialOffset += _stepHeight * widget.list.length - _boundaryOffset;
    }

    _scrollController = ScrollController(initialScrollOffset: initialOffset);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleRollover() {
    if (!_canRollover) return;

    final double segmentHeight = widget.list.length * _stepHeight;

    /*
    If _canRollover == true, column is divided into three repeated segments. 
    To create perceived infinite scroll, adjust controller position to keep scroll window in the middle segment.
    */
    if (_scrollController.offset > segmentHeight * 2)
      _scrollController.position.correctBy(-segmentHeight);
    else if (_scrollController.offset < segmentHeight)
      _scrollController.position.correctBy(segmentHeight);
  }

  int _getNearestStepIndex() {
    for (int i = 0; i < widget.list.length * (_canRollover ? 3 : 1); i++) {
      double stepCenter = _stepHeight * (i - .5);

      if (_canRollover) stepCenter -= _boundaryOffset;

      final offsetFromStepCenter =
          (stepCenter - _scrollController.offset).abs();

      if (offsetFromStepCenter < _stepHeight) return i;
    }
    return 0;
  }

  void _snapScroll() {
    final theme = SemanticTheme.of(context);

    if (_scrollController.offset % _stepHeight == 0) return;

    final delayBeforeSnap = Duration(milliseconds: 50);

    Future.delayed(delayBeforeSnap, () {
      double targetOffset = _getNearestStepIndex() * _stepHeight;

      if (_canRollover) targetOffset -= _boundaryOffset;

      _scrollController.animateTo(
        targetOffset,
        duration: theme.duration.short,
        curve: theme.curve.hurried,
      );
    });
  }

  void _onScroll() {
    LabeledValue<T> newValue =
        widget.list[_getNearestStepIndex() % widget.list.length];

    if (newValue != _selectedValue) {
      triggerHapticWith(HapticOption.click);
      setState(() {
        _selectedValue = newValue;
      });
      widget.onChange(_selectedValue);
    }

    _handleRollover();
  }

  @override
  Widget build(BuildContext context) {
    double verticalPadding = 0;
    if (!_canRollover) {
      verticalPadding = _boundaryOffset;
    }

    return Container(
      height: _stepsVisible * _stepHeight,
      child: NotificationListener<Notification>(
        onNotification: (scrollNotification) {
          switch (scrollNotification.runtimeType) {
            case ScrollEndNotification:
              _snapScroll();
              break;
            case ScrollUpdateNotification:
              _onScroll();
              break;
          }
          // TODO return false/null or true for `onNotification`?
          return false;
        },
        child: ListView(
          controller: _scrollController,
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
          ),
          children: [
            RollerColumnBody(
              selectedValue: _selectedValue,
              list: widget.list,
              canRollover: _canRollover,
              crossAxisAlignment: widget.crossAxisAlignment,
            )
          ],
        ),
      ),
    );
  }
}
