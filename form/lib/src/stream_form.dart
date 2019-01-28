import 'package:flutter/material.dart';
import 'package:stream/index.dart';

import 'bloc.dart';
import 'widget.dart';
import 'data/index.dart';

abstract class StreamForm<T extends StreamableFormFieldData,
    U extends StreamableFormSectionHeaderData> extends StatelessWidget {
  Future<StreamableFormData> get initialFormData => null;

  //If passed in, this is override initialFormData;
  StreamFormBloc get bloc => null;

  Widget build(BuildContext context) {
    final bloc = this.bloc ?? StreamFormBloc.withInitialData(initialFormData);
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
