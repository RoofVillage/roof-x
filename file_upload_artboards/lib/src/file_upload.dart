import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:icon_library/index.dart';
import 'package:image_picker/image_picker.dart';
import 'package:button_components/index.dart';

class FileUploadArtboard extends SegueFloatingArtboard {
  @override
  String get title => "Upload";

  @override
  List<RoofTransitionButton> get buttons => [
        RoofTransitionButton(
          text: "Take a picture",
          iconReference: IconReference.camera,
          onTap: (BuildContext context) async {
            final file = await ImagePicker.pickImage(
              source: ImageSource.camera,
            );
            if (file == null) return;

            Navigator.of(context).pop(file);
          },
        ),
        RoofTransitionButton(
          text: "Upload a file",
          iconReference: IconReference.addImage,
          onTap: (BuildContext context) async {
            print("context: $context");
            final file = await ImagePicker.pickImage(
              source: ImageSource.gallery,
            );
            Navigator.of(context).pop(file);
          },
        ),
      ];
}
