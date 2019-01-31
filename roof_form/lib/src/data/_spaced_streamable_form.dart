import 'package:form/index.dart';

import '_spaced_streamable_form_section.dart';

class SpacedStreamableFormData extends StreamableFormData {
  SpacedStreamableFormData.withFields({List<StreamableFormFieldData> fieldData})
      : super(sectionData: [
          SpacedStreamableFormSectionData(fieldData: fieldData)
        ]);
}