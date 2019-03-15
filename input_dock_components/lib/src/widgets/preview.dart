import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import '../input_dock.dart';
import 'dart:math';

typedef void RemoveFileCallback(String file);

class FilePreviewContainer extends StatefulWidget {
  _FilePreviewContainerState createState() => _FilePreviewContainerState();
}

class _FilePreviewContainerState extends State<FilePreviewContainer>
    with SingleTickerProviderStateMixin {
  static const double _maxHeight = 120;

  @override
  Widget build(BuildContext context) {
    final InheritedInputDock dock = RoofInputDock.of(context);

    final List<Widget> previews = [];

    for (var file in dock.files) {
      final preview = _FilePreview(
        key: ObjectKey(file),
        file: file,
        isLastFile: (file == dock.files.last),
        isOnlyFile: (dock.files.length == 1),
      );
      previews.add(preview);
    }

    final previewRow = Container(
      height: dock.files.isNotEmpty ? _maxHeight : 0,
      child: ListView(
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
  final String file;
  final bool isLastFile;
  final bool isOnlyFile;

  _FilePreview({
    Key key,
    this.file,
    this.isLastFile,
    this.isOnlyFile,
  }) : super(key: key);

  _FilePreviewState createState() => _FilePreviewState();
}

class _FilePreviewState extends State<_FilePreview>
    with SingleTickerProviderStateMixin {
  static const double _previewWidth = 160;

  bool _show = true;

  _remove(String file) {
    setState(() {
      _show = false;
    });
    Future.delayed(RoofDuration.short, () {
      RoofInputDock.of(context).removeFile(file);
    });
  }

  _removeOnly(String file) {
    RoofInputDock.of(context).removeFile(file);
  }

  @override
  Widget build(BuildContext context) {
    final uniqueInt = int.parse(widget.file);
    final uniqueColor = Color.fromRGBO(
      Random(uniqueInt).nextInt(255),
      Random(uniqueInt * 2).nextInt(255),
      Random(uniqueInt * 3).nextInt(255),
      1,
    );

    final imageDecoration = BoxDecoration(
      color: uniqueColor,
      borderRadius: BorderRadius.all(
        RoofCornerRadius.small,
      ),
    );

    final closeIcon = IconReference.closeFilled.buildSvg(
      color: Colors.black.withAlpha(180),
    );

    final closeButton = GestureDetector(
      onTap: widget.isOnlyFile
          ? () => _removeOnly(widget.file)
          : () => _remove(widget.file),
      child: Container(
        width: _show ? null : 0,
        padding: EdgeInsets.all(RoofDistance.a),
        child: closeIcon,
      ),
    );

    final fileImage = Container(
      decoration: imageDecoration,
      // child: Image.asset(widget.file),
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
        decoration: imageDecoration,
        margin: EdgeInsets.only(
          top: RoofDistance.c,
          right: widget.isLastFile ? 0 : RoofDistance.a,
        ),
        child: Stack(
          children: [animatedWidthContainer, closeButton],
        ),
      ),
    );
  }
}
