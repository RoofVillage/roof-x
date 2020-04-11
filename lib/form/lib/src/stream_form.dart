import 'package:flutter/material.dart';
import 'package:stream/index.dart';

import 'bloc.dart';
import 'widget.dart';
import 'data/field.dart';
import 'data/section_header.dart';
import 'data/section_button.dart';
import 'data/form.dart';

abstract class StreamForm extends StatelessWidget {
  final bloc = StreamFormBloc();

  Widget build(BuildContext context) {
    final form = StreamFormBuilder(
      buildField: buildField,
      buildSectionHeader: buildFormSectionHeader,
      buildSectionButton: buildFormSectionButton,
    );

    return BlocProvider(
      bloc: bloc,
      child: form,
    );
  }

  Widget buildField<T extends StreamableFormFieldData>({
    @required T fieldData,
    @required StreamableFormData formData,
    @required int fieldIndex,
    @required int sectionIndex,
    @required BuildContext context,
  }) =>
      null;

  Widget buildFormSectionHeader<T extends StreamableFormSectionHeaderData>({
    @required T headerData,
    @required int sectionIndex,
    @required BuildContext context,
  }) =>
      null;

  Widget buildFormSectionButton<T extends StreamableFormSectionButtonData>({
    @required T buttonData,
    @required int sectionIndex,
    @required BuildContext context,
  }) =>
      null;
}
