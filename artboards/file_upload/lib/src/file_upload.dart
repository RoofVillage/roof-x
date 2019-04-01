// import 'package:flutter/material.dart';
// import 'package:floating_artboard_templates/index.dart';
// import 'package:icon_library/index.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:button_components/index.dart';

// class FileUploadArtboard extends StackedFloatingArtboard {
//   @override
//   String get title => "Upload";

//   final cameraButton = RoofTransitionButton(
//     text: "Take a picture",
//     iconReference: IconReference.camera,
//     onTap: (BuildContext context) async {
//       final file = await ImagePicker.pickImage(
//         source: ImageSource.camera,
//       );
//       if (file == null) return;

//       ArtboardNavigator.of(context).pop(file);
//     },
//   );

//   final uploadButton = RoofTransitionButton(
//     text: "Upload a picture",
//     iconReference: IconReference.addImage,
//     onTap: (BuildContext context) async {
//       final file = await ImagePicker.pickImage(
//         source: ImageSource.gallery,
//       );
//       if (file == null) return;

//       ArtboardNavigator.of(context).pop(file);
//     },
//   );

//   @override
//   List<RoofTransitionButton> get buttons => [cameraButton, uploadButton];
// }
