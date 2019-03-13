import 'package:icon_library/index.dart';
import '../auxiliary_widget.dart';
import '../../dock_data.dart';

class AddImage extends AuxiliaryWidget {
  static final _iconReference = IconReference.addImage;

  static void _action({DockSubmitData data}) {
    // Open image picker and return selection
    final image = "file9000";
    data.addFile(image);

    print("addImage — files: ${data.getFiles()}");
  }

  AddImage() : super(iconReference: _iconReference, action: _action);
}
