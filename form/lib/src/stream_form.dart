import 'package:flutter/material.dart';
import 'package:stream/index.dart';

import 'bloc.dart';
import 'widget.dart';
import 'data/index.dart';

abstract class StreamForm<T extends StreamableFormFieldData,
    U extends StreamableFormSectionHeaderData> extends StatelessWidget {
  final bloc = StreamFormBloc();

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
