import 'package:flutter/material.dart';
import 'package:stream/index.dart';

import 'bloc.dart';
import 'widget.dart';
import 'data/field.dart';
import 'data/section_header.dart';
import 'data/form.dart';

abstract class StreamForm<T extends StreamableFormFieldData,
    U extends StreamableFormSectionHeaderData> extends StatelessWidget {
  final bloc = StreamFormBloc();

  Widget build(BuildContext context) {
    final form = StreamFormBuilder(
      buildField: buildField,
      buildSectionHeader: buildSectionHeader,
    );

    return BlocProvider(
      bloc: bloc,
      child: form,
    );
  }

  Widget buildField({
    @required T fieldData,
    @required StreamableFormData formData,
    @required int fieldIndex,
    @required int sectionIndex,
    @required BuildContext context,
  }) =>
      null;

  Widget buildSectionHeader({
    @required U headerData,
    @required int sectionIndex,
    @required BuildContext context,
  }) =>
      null;
}
