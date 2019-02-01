import 'package:flutter/material.dart';
import 'package:stream/index.dart';

import 'bloc.dart';
import 'widget.dart';
import 'data/index.dart';

abstract class StreamForm<T extends StreamableFormFieldData,
    U extends StreamableFormSectionHeaderData> extends StatelessWidget {
  Future<StreamableFormData> get initialFormData => null;

  //If overriden, this is overrides initialFormData;
  StreamFormBloc get bloc => StreamFormBloc.withInitialData(initialFormData);

  Widget build(BuildContext context) {
    final table = StreamFormBuilder(
        buildField: buildField, buildSectionHeader: buildSectionHeader);
    return BlocProvider(
      bloc: bloc,
      child: table,
    );
  }

  Widget buildField({T fieldData, int fieldIndex, int sectionIndex}) => null;
  Widget buildSectionHeader({U headerData, int sectionIndex}) => null;
}
