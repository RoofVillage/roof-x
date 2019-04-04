import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

mixin ImagePickerBuilder {
  /// Returns files as [List<Asset>]. Provide [thumbnailWidth] and [thumbnailHeight] to pre-build thumbnails and attach to files.
  Future<List<Asset>> pickImages({
    @required BuildContext context,
    int thumbnailWidth,
    int thumbnailHeight,
  }) async {
    final theme = RoofTheme.of(context);
    const maxFiles = 300;

    final files = await MultiImagePicker.pickImages(
      maxImages: maxFiles,
      enableCamera: true,
      options: CupertinoOptions(
        selectionFillColor: _convertToHex(theme.color.background.submitButton),
        selectionStrokeColor:
            _convertToHex(theme.color.background.submitButton),
        selectionShadowColor: _convertToHex(theme.shadow.color),
        selectionTextColor: _convertToHex(Colors.white),
      ),
    );

    if (files == null) return [];

    if (thumbnailWidth != null && thumbnailHeight != null) {
      final int screenResMultipler = 3;

      for (final file in files) {
        await file.requestThumbnail(
          thumbnailWidth * screenResMultipler,
          thumbnailHeight * screenResMultipler,
        );
      }
    }

    return files;
  }

  static String _convertToHex(Color color) {
    final _stringWithAlpha = color.value.toRadixString(16);
    final _stringWithoutAlpha =
        _stringWithAlpha.substring(2, _stringWithAlpha.length);
    return "#$_stringWithoutAlpha";
  }
}
