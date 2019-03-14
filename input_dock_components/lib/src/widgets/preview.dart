import 'package:flutter/material.dart';

class FilePreviewContainer extends StatelessWidget {
  final List<String> files;
  final Function(String) removeFile;

  FilePreviewContainer({this.files, this.removeFile});

  @override
  Widget build(BuildContext context) {
    remove() {
      removeFile(files[0]);
    }

    return GestureDetector(
        onTap: remove,
        child: Container(
          color: Colors.yellow,
          height: 50,
          width: 50,
        ));
  }
}
