import 'package:artboard/index.dart';

abstract class FloatingArtboard<T> extends Artboard<T> {
  bool get allowsBackNavigation => true;
}
