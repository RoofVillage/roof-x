import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_image_picker/asset.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import 'package:haptics/index.dart';

import '../input_dock.dart';

class FilePreviewContainer extends StatefulWidget {
  _FilePreviewContainerState createState() => _FilePreviewContainerState();
}

class _FilePreviewContainerState extends State<FilePreviewContainer>
    with SingleTickerProviderStateMixin {
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

    for (var file in dock.files) {
      final preview = _FilePreview(
        key: ObjectKey(file),
        file: file,
        isRightPadded: (file != dock.files.last),
        animateOnRemove: (dock.files.length > 1),
        previewWidth: dock.previewWidth,
        removeFile: () => dock.removeFile(file),
      );
      previews.add(preview);
    }

    final previewRow = Container(
      height: dock.files.isNotEmpty ? dock.previewHeight : 0,
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
  final Asset file;
  final bool isRightPadded;
  final bool animateOnRemove;
  final double previewWidth;
  final VoidCallback removeFile;

  _FilePreview({
    Key key,
    @required this.file,
    @required this.isRightPadded,
    @required this.animateOnRemove,
    @required this.previewWidth,
    @required this.removeFile,
  })  : assert(file.thumbData != null),
        super(key: key);

  _FilePreviewState createState() => _FilePreviewState();
}

class _FilePreviewState extends State<_FilePreview>
    with SingleTickerProviderStateMixin {
  bool _show = true;

  _remove() {
    Haptic().triggerWith(HapticOption.click);

    if (widget.animateOnRemove) {
      setState(() {
        _show = false;
      });
      Future.delayed(RoofDuration.short, () {
        widget.removeFile();
        widget.file.release();
      });
    } else {
      widget.removeFile();
      widget.file.release();
    }
  }

  @override
  Widget build(BuildContext context) {
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

    final thumbnail = Image.memory(
      widget.file.thumbData.buffer.asUint8List(),
      fit: BoxFit.cover,
      gaplessPlayback: true,
    );

    final imageWidget = ClipRRect(
      borderRadius: BorderRadius.all(RoofCornerRadius.small),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: thumbnail,
    );

    final animatedWidthContainer = AnimatedSize(
      vsync: this,
      curve: RoofCurve.quick,
      duration: RoofDuration.short,
      alignment: Alignment.topLeft,
      child: Container(
        width: _show ? widget.previewWidth : 0,
        child: imageWidget,
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
