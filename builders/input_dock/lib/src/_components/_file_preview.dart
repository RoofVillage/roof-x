import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_image_picker/asset.dart';
import 'package:semantic_theme/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:haptics/index.dart';

import '../input_dock.dart';

class DockFilePreview extends StatefulWidget {
  DockFilePreviewState createState() => DockFilePreviewState();
}

class DockFilePreviewState extends State<DockFilePreview>
    with SingleTickerProviderStateMixin {
  final ScrollController _listViewController = ScrollController();

  @override
  void didChangeDependencies() {
    final theme = SemanticTheme.of(context);

    Future.delayed(theme.duration.short, () {
      _listViewController.animateTo(
        _listViewController.position.maxScrollExtent,
        duration: theme.duration.short,
        curve: theme.curve.hurried,
      );
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final dock = InputDock.of(context);
    final theme = SemanticTheme.of(context);

    final previews = <Widget>[];

    for (final file in dock.files) {
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
        padding: EdgeInsets.symmetric(
          horizontal: theme.distance.padding.horizontal.medium,
        ),
        scrollDirection: Axis.horizontal,
        children: previews,
      ),
    );

    return AnimatedSize(
      vsync: this,
      curve: theme.curve.hurried,
      duration: theme.duration.short,
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
    final theme = SemanticTheme.of(context);

    triggerHapticWith(HapticOption.click);

    if (widget.animateOnRemove) {
      setState(() => _show = false);
      Future.delayed(
        theme.duration.short,
        () {
          widget.removeFile();
          widget.file.release();
        },
      );
    } else {
      widget.removeFile();
      widget.file.release();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final removeIcon = StandardIcon.close.buildWidget(
      color: Colors.black.withAlpha(180),
    );

    final removeButton = GestureDetector(
      onTap: _remove,
      child: Container(
        width: _show ? null : 0,
        padding: EdgeInsets.all(
          theme.distance.padding.horizontal.small,
        ),
        child: removeIcon,
      ),
    );

    final thumbnail = Image.memory(
      widget.file.thumbData.buffer.asUint8List(),
      fit: BoxFit.cover,
      gaplessPlayback: true,
    );

    final imageWidget = ClipRRect(
      borderRadius: BorderRadius.all(theme.radius.small),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: thumbnail,
    );

    final animatedWidthContainer = AnimatedSize(
      vsync: this,
      curve: theme.curve.hurried,
      duration: theme.duration.short,
      alignment: Alignment.topLeft,
      child: Container(
        width: _show ? widget.previewWidth : 0,
        child: imageWidget,
      ),
    );

    return AnimatedOpacity(
      opacity: _show ? 1 : 0,
      curve: theme.curve.hurried,
      duration: theme.duration.short,
      child: Container(
        margin: EdgeInsets.only(
          top: theme.distance.spacing.vertical.medium,
          right:
              widget.isRightPadded ? theme.distance.spacing.horizontal.min : 0,
        ),
        child: Stack(
          children: [
            animatedWidthContainer,
            removeButton,
          ],
        ),
      ),
    );
  }
}
