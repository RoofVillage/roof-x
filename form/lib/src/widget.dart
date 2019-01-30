import 'package:flutter/material.dart';
import 'package:stream/index.dart';

import 'bloc.dart';
import 'data/index.dart';

class StreamFormBuilder<T extends StreamFormBloc> extends StatelessWidget {
  final _FieldBuilder buildField;

  final _FormSectionHeaderBuilder buildSectionHeader;

  StreamFormBuilder(
      {Key key, @required this.buildField, this.buildSectionHeader})
      : super(key: key);

  Widget build(BuildContext context) {
    final T formBloc = BlocProvider.of<T>(context);
    return StreamBuilder<StreamableFormData>(
        stream: formBloc.outForm,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container(child: Text("Moo"));

          return _createForm(
              bloc: formBloc, context: context, formData: snapshot.data);
        });
  }

  Widget _createForm(
      {@required T bloc,
      @required BuildContext context,
      @required StreamableFormData formData}) {
    final rows = <Widget>[];

    //Add each sections that accept streamable updates.
    for (var i = 0; i < formData.sectionData.length; i++) {
      final sectionData = formData.sectionData[i];
      final outSectionStream =
          bloc.outSection.where((data) => data.key == sectionData.key);

      final sectionHeader = _createSectionHeader(
          outSectionStream: outSectionStream,
          sectionData: sectionData,
          sectionIndex: i);

      rows.add(sectionHeader);

      final section = _createSection(
          bloc: bloc,
          outSectionStream: outSectionStream,
          sectionData: sectionData,
          sectionIndex: i);

      rows.add(section);
    }

    final form =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: rows);

    return form;
  }

  Widget _createSectionHeader(
      {@required Stream outSectionStream,
      @required StreamableFormSectionData sectionData,
      @required int sectionIndex}) {
    //Add the header if needed. If the section changes, check to make sure a header is still needed.
    final sectionHeader = StreamBuilder<StreamableFormSectionData>(
        stream: outSectionStream,
        initialData: sectionData,
        builder: (context, snapshot) {
          final shouldShowSectionHeader = sectionData.headerData != null &&
              sectionData.fieldData.isNotEmpty &&
              buildSectionHeader != null;

          if (!snapshot.hasData || !shouldShowSectionHeader) return _empty();

          final header = buildSectionHeader(
              headerData: sectionData.headerData, sectionIndex: sectionIndex);

          if (header == null) return _empty();

          return header;
        });
    return sectionHeader;
  }

  Widget _createSection(
      {@required T bloc,
      @required Stream outSectionStream,
      @required StreamableFormSectionData sectionData,
      @required int sectionIndex}) {
    final section = StreamBuilder<StreamableFormSectionData>(
        stream: outSectionStream,
        initialData: sectionData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return SliverToBoxAdapter();

          final section = _createSectionBody(
              bloc: bloc,
              sectionData: snapshot.data,
              sectionIndex: sectionIndex);

          return section;
        });

    return section;
  }

  Widget _createSectionBody(
      {@required T bloc,
      @required StreamableFormSectionData sectionData,
      @required int sectionIndex}) {
    final rows = <Row>[];

    double usedRowPercentage = 0;
    double prevFieldRowPercentage = 0;
    int prevFieldRowSlots = 0;
    var rowChildren = <Widget>[];
    final space = Container(color: Colors.green, height: 20, width: 40);
    for (var i = 0; i < sectionData.fieldData.length; i++) {
      final fieldData = sectionData.fieldData[i];
      final outFieldStream =
          bloc.outField.where((data) => data.key == fieldData.key);

      final field = _createField(
          outFieldStream: outFieldStream,
          fieldData: fieldData,
          fieldIndex: i,
          sectionIndex: sectionIndex,
          fieldHorizontalSpacing: sectionData.fieldHorizontalSpacing);

      bool isFirstField = usedRowPercentage == 0;
      bool isLastField = i == sectionData.fieldData.length - 1;

      if (usedRowPercentage <= 1 - fieldData.fieldWidthRatio) {
        if (!isFirstField) rowChildren.add(space);
        rowChildren.add(field);
        usedRowPercentage += fieldData.fieldWidthRatio;
      }

      if (usedRowPercentage >= fieldData.rowSlots || isLastField) {
        final remainingRowPercentage = 1 - usedRowPercentage;
        if (remainingRowPercentage > 0) {
          final fill = Flexible(
              flex: (remainingRowPercentage * prevFieldRowSlots).floor(),
              child: Container(height: 20, color: Colors.yellow));
          rowChildren.add(fill);
        }
        final row = Row(children: rowChildren);
        rows.add(row);
        rowChildren = <Widget>[];
        usedRowPercentage = 0;
      }

      prevFieldRowSlots = fieldData.rowSlots;
      prevFieldRowPercentage = fieldData.fieldWidthRatio;
    }

    final section = Column(children: rows);

    return section;
  }

  Widget _createField(
      {@required Stream outFieldStream,
      @required StreamableFormFieldData fieldData,
      @required int fieldIndex,
      @required int sectionIndex,
      @required double fieldHorizontalSpacing}) {
    return StreamBuilder<StreamableFormFieldData>(
        stream: outFieldStream,
        initialData: fieldData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return _empty();
          final field = buildField(
              fieldData: snapshot.data,
              fieldIndex: fieldIndex,
              sectionIndex: sectionIndex);

          if (field == null) return _empty();

          return Expanded(flex: fieldData.slots, child: field);
        });
  }

  Widget _empty() => Container();
}

typedef _FieldBuilder = Widget Function(
    {@required StreamableFormFieldData fieldData,
    int fieldIndex,
    int sectionIndex});

typedef _FormSectionHeaderBuilder = Widget Function(
    {@required StreamableFormSectionHeaderData headerData, int sectionIndex});
