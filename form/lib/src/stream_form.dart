import 'package:flutter/material.dart';
import 'package:stream/index.dart';

import 'bloc.dart';
import 'widget.dart';
import 'data/index.dart';

abstract class StreamForm<T extends StreamableFormFieldData,
    U extends StreamableFormSectionHeaderData> extends StatelessWidget {
  Future<StreamableFormData> get initialFormData => null;

  String get address => null;

  Map<String, dynamic> get params => null;

  Function get onSubmit => (context) => bloc.submit();

  //If overriden, this is overrides initialFormData;
  StreamFormBloc get bloc => StreamFormBloc.withInitialData(initialFormData,
      address: address, params: params);

  Widget build(BuildContext context) {
    final form = StreamFormBuilder(
        buildField: buildField, buildSectionHeader: buildSectionHeader);
    return BlocProvider(
      bloc: bloc,
      child: form,
    );
  }

  Widget buildField({T fieldData, int fieldIndex, int sectionIndex}) => null;
  Widget buildSectionHeader({U headerData, int sectionIndex}) => null;
}
