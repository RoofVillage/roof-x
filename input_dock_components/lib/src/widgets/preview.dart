import 'package:flutter/material.dart';

typedef void FileRemoveCallback(String file);

class FilePreviewContainer extends StatelessWidget {
  final List<String> files;
  final FileRemoveCallback removeFile;

  FilePreviewContainer({this.files, this.removeFile});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
