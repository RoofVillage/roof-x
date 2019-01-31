import 'package:form/index.dart';
import 'package:spec/index.dart';

class SpacedStreamableFormSectionData extends StreamableFormSectionData {
  SpacedStreamableFormSectionData(
      {StreamableFormSectionHeaderData headerData,
      List<StreamableFormFieldData> fieldData})
      : super(
            headerData: headerData,
            fieldData: fieldData,
            fieldHorizontalSpacing: RoofDistance.c);
}
