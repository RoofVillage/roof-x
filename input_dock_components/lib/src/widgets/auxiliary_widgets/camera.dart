import 'package:icon_library/index.dart';
import '../auxiliary_widget.dart';
import '../../dock_data.dart';

class Camera extends AuxiliaryWidget {
  static final _iconReference = IconReference.camera;
  
  static void _action({DockSubmitData data}) {
    print("camera");

    // Open camera and assign image to result
    final image = "file9000";
    data.addFile(image);
  }

  Camera() : super(iconReference: _iconReference, action: _action);
}
