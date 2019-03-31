import 'package:artboard/index.dart';
import 'floating_artboard_button_option.dart';

abstract class FloatingArtboard<T> extends Artboard<T> {
  bool get allowsBackNavigation => true;
  FloatingArtboardButtonOption get navButtonOption => null;
}
