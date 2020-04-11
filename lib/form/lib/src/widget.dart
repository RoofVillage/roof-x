import 'package:flutter/material.dart';
import 'package:form/src/data/section_button.dart';
import 'package:stream/index.dart';

import 'bloc.dart';
import 'data/field.dart';
import 'data/section_header.dart';
import 'data/section.dart';
import 'data/form.dart';

class StreamFormBuilder<T extends StreamFormBloc> extends StatelessWidget {
  final _FieldBuilder buildField;
  final _FormSectionHeaderBuilder buildSectionHeader;
  final _FormSectionButtonBuilder buildSectionButton;

  Widget get _empty => Container();

  StreamFormBuilder({
    Key key,
    @required this.buildField,
    this.buildSectionHeader,
    this.buildSectionButton,
  }) : super(key: key);

  Widget build(BuildContext context) {
    final T formBloc = BlocProvider.of<T>(context);
    return StreamBuilder<StreamableFormData>(
      stream: formBloc.outForm,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Container(
            child: Text("Snapshot has no data"),
          );

        return _createForm(
          context: context,
          formData: snapshot.data,
        );
      },
    );
  }

  Widget _createForm({
    @required BuildContext context,
    @required StreamableFormData formData,
  }) {
    final rows = <Widget>[];

    //Add each sections that accept streamable updates.
    for (var i = 0; i < formData.sectionData.length; i++) {
      final sectionData = formData.sectionData[i];

      if (i > 0) {
        rows.add(
          Container(height: formData.sectionVerticalSpacing),
        );
      }

      final sectionHeader = _createSectionHeader(
        sectionData: sectionData,
        sectionIndex: i,
        context: context,
      );

      rows.add(sectionHeader);

      final sectionRows = _createSectionRows(
        sectionData: sectionData,
        formData: formData,
        sectionIndex: i,
        context: context,
      );

      rows.addAll(sectionRows);

      final sectionButton = _createSectionButton(
        sectionData: sectionData,
        sectionIndex: i,
        context: context,
      );

      rows.add(sectionButton);
    }

    final form = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows,
    );

    return form;
  }

  Widget _createSectionHeader({
    @required StreamableFormSectionData sectionData,
    @required int sectionIndex,
    @required BuildContext context,
  }) {
    final shouldShowSectionHeader = sectionData.headerData != null &&
        (sectionData.fieldData.isNotEmpty || sectionData.buttonData != null) &&
        buildSectionHeader != null;

    if (!shouldShowSectionHeader) return _empty;

    return buildSectionHeader(
          headerData: sectionData.headerData,
          sectionIndex: sectionIndex,
          context: context,
        ) ??
        _empty;
  }

  Widget _createSectionButton({
    @required StreamableFormSectionData sectionData,
    @required int sectionIndex,
    @required BuildContext context,
  }) {
    final shouldShowSectionButton =
        sectionData.buttonData != null && buildSectionButton != null;

    if (!shouldShowSectionButton) return _empty;

    return buildSectionButton(
          buttonData: sectionData.buttonData,
          sectionIndex: sectionIndex,
          context: context,
        ) ??
        _empty;
  }

  List<Row> _createSectionRows({
    @required StreamableFormSectionData sectionData,
    @required StreamableFormData formData,
    @required int sectionIndex,
    @required BuildContext context,
  }) {
    final rows = <Row>[];

    double percentRowFilled = 0;
    var rowChildren = <Widget>[];

    final horizontalSpacer = Container(
      width: formData.fieldHorizontalSpacing,
    );
    final verticalSpacer = Container(
      height: formData.fieldVerticalSpacing,
    );

    for (var i = 0; i < sectionData.fieldData.length; i++) {
      final fieldData = sectionData.fieldData[i];

      final field = _createField(
        fieldData: fieldData,
        formData: formData,
        fieldIndex: i,
        sectionIndex: sectionIndex,
        context: context,
      );

      bool isLastField = i == sectionData.fieldData.length - 1;
      double percentRowWillFill = percentRowFilled + fieldData.fieldSize;

      if (percentRowWillFill <= 1) {
        if (percentRowFilled > 0) rowChildren.add(horizontalSpacer);
        rowChildren.add(field);

        if (percentRowWillFill == 1) {
          final row = Row(children: rowChildren);
          rows.add(row);

          rowChildren = <Widget>[];
          percentRowFilled = 0;
        } else {
          percentRowFilled += fieldData.fieldSize;
        }
      } else {
        rowChildren.add(_remainingSpaceFiller(percentRowFilled));

        final row = Row(children: rowChildren);
        rows.add(row);

        rowChildren = <Widget>[field];
        percentRowFilled = fieldData.fieldSize;
      }

      if (isLastField && rowChildren.length > 0) {
        rowChildren.add(_remainingSpaceFiller(percentRowFilled));

        final row = Row(children: rowChildren);
        rows.add(row);
      } else {
        rows.add(
          Row(
            children: [
              verticalSpacer,
            ],
          ),
        );
      }
    }

    return rows;
  }

  Flexible _remainingSpaceFiller(double percentRowFilled) {
    double remainingRowPercentage = 1 - percentRowFilled;
    return Flexible(
      flex: (remainingRowPercentage * 100).floor(),
      child: Container(),
    );
  }

  Widget _createField<T extends StreamableFormFieldData>({
    @required T fieldData,
    @required StreamableFormData formData,
    @required int fieldIndex,
    @required int sectionIndex,
    @required BuildContext context,
  }) {
    final field = buildField<T>(
          fieldData: fieldData,
          formData: formData,
          fieldIndex: fieldIndex,
          sectionIndex: sectionIndex,
          context: context,
        ) ??
        _empty;

    final fieldHorizontalFlex = (fieldData.fieldSize * 100).floor();

    return Expanded(
      flex: fieldHorizontalFlex,
      child: field,
      key: ValueKey(fieldData.key),
    );
  }
}

typedef _FieldBuilder = Widget Function<T extends StreamableFormFieldData>({
  @required T fieldData,
  @required StreamableFormData formData,
  @required int fieldIndex,
  @required int sectionIndex,
  @required BuildContext context,
});

typedef _FormSectionHeaderBuilder = Widget Function({
  @required StreamableFormSectionHeaderData headerData,
  @required int sectionIndex,
  @required BuildContext context,
});

typedef _FormSectionButtonBuilder = Widget Function({
  @required StreamableFormSectionButtonData buttonData,
  @required int sectionIndex,
  @required BuildContext context,
});
