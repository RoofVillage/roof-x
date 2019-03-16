import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import 'package:haptics/index.dart';

import '../input_dock.dart';

typedef void RemoveFileCallback(String file);

class FilePreviewContainer extends StatefulWidget {
  _FilePreviewContainerState createState() => _FilePreviewContainerState();
}

class _FilePreviewContainerState extends State<FilePreviewContainer>
    with SingleTickerProviderStateMixin {
  static const double _maxHeight = 120;

  final ScrollController _listViewController = ScrollController();

  @override
  void didChangeDependencies() {
    Future.delayed(RoofDuration.short, () {
      _listViewController.animateTo(
        _listViewController.position.maxScrollExtent,
        duration: RoofDuration.short,
        curve: RoofCurve.quick,
      );
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final InheritedInputDock dock = RoofInputDock.of(context);

    final List<Widget> previews = [];

    for (var file in dock.previews) {
      final preview = _FilePreview(
        key: ObjectKey(file),
        file: file,
        isRightPadded: (file != dock.previews.last),
        shouldFadeOut: (dock.previews.length > 1),
      );
      previews.add(preview);
    }

    final previewRow = Container(
      height: dock.previews.isNotEmpty ? _maxHeight : 0,
      child: ListView(
        controller: _listViewController,
        padding: EdgeInsets.symmetric(horizontal: RoofDistance.c),
        scrollDirection: Axis.horizontal,
        children: previews,
      ),
    );

    return AnimatedSize(
      vsync: this,
      curve: RoofCurve.quick,
      duration: RoofDuration.short,
      child: previewRow,
    );
  }
}

class _FilePreview extends StatefulWidget {
  final File file;
  final bool isRightPadded;
  final bool shouldFadeOut;

  _FilePreview({
    Key key,
    this.file,
    this.isRightPadded,
    this.shouldFadeOut,
  }) : super(key: key);

  _FilePreviewState createState() => _FilePreviewState();
}

class _FilePreviewState extends State<_FilePreview>
    with SingleTickerProviderStateMixin {
  static const double _previewWidth = 160;

  bool _show = true;

  _remove() {
    Haptic.triggerWith(HapticOption.click);

    if (widget.shouldFadeOut) {
      setState(() {
        _show = false;
      });
      Future.delayed(RoofDuration.short, () {
        RoofInputDock.of(context).removeFile(widget.file);
      });
    } else {
      RoofInputDock.of(context).removeFile(widget.file);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Unique color for testing
    final uniqueInt = DateTime.now().millisecond;
    final uniqueColor = Color.fromRGBO(
      uniqueInt % 255,
      (uniqueInt * 2) % 255,
      (uniqueInt * 3) % 255,
      1,
    );

    final removeIcon = IconReference.closeFilled.buildSvg(
      color: Colors.black.withAlpha(180),
    );

    final removeButton = GestureDetector(
      onTap: _remove,
      child: Container(
        width: _show ? null : 0,
        padding: EdgeInsets.all(RoofDistance.a),
        child: removeIcon,
      ),
    );

    final imageDecoration = BoxDecoration(
      color: uniqueColor,
      borderRadius: BorderRadius.all(
        RoofCornerRadius.small,
      ),
    );

    final fileImage = ClipRRect(
      borderRadius: BorderRadius.all(RoofCornerRadius.small),
      child: Image.file(
        widget.file,
        fit: BoxFit.cover,
      ),
    );

    final animatedWidthContainer = AnimatedSize(
      vsync: this,
      curve: RoofCurve.quick,
      duration: RoofDuration.short,
      alignment: Alignment.topLeft,
      child: Container(
        width: _show ? _previewWidth : 0,
        child: fileImage,
      ),
    );

    return AnimatedOpacity(
      opacity: _show ? 1 : 0,
      curve: RoofCurve.quick,
      duration: RoofDuration.short,
      child: Container(
        margin: EdgeInsets.only(
          top: RoofDistance.c,
          right: widget.isRightPadded ? RoofDistance.a : 0,
        ),
        child: Stack(
          children: [animatedWidthContainer, removeButton],
        ),
      ),
    );
  }
}
