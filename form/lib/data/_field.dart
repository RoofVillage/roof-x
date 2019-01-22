import 'package:stream/streamable_data.dart';

class StreamableFormFieldData extends StreamableData {
  int rowSlots;
  int slots;
  bool forceNewRow;

  StreamableFormFieldData(
      {this.rowSlots = 1,
      this.slots = 1,
      this.forceNewRow = false,
      bool hidden})
      : super(hidden: hidden);
}
