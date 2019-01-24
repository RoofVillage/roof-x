import 'package:flutter/material.dart';
import 'package:stream/bloc_provider.dart';

import 'bloc.dart';
import 'data/index.dart';

abstract class StreamFormWidget<
    T extends StreamFormBloc,
    U extends StreamableFormFieldData,
    V extends StreamableFormSectionHeaderData> extends StatelessWidget {
  Widget build(BuildContext context) {
    final form = _StreamForm<T>(
        buildField: buildField, buildSectionHeader: buildSectionHeader);
    return form;
  }

  Widget buildField({U fieldData, int fieldIndex, int sectionIndex}) => null;
  Widget buildSectionHeader({V headerData, int sectionIndex}) => null;
}

class _StreamForm<T extends StreamFormBloc> extends StatelessWidget {
  final _FieldBuilder buildField;

  final _FormSectionHeaderBuilder buildSectionHeader;

  _StreamForm({Key key, @required this.buildField, this.buildSectionHeader})
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
    final List<Widget> slivers = [];

    //Add each sections that accept streamable updates.
    formData.sectionData
      ..asMap().forEach((index, sectionData) {
        final outSectionStream =
            bloc.outSection.where((data) => data.key == sectionData.key);

        final sectionHeader = _createSectionHeader(
            outSectionStream: outSectionStream,
            sectionData: sectionData,
            sectionIndex: index);

        slivers.add(sectionHeader);

        final section = _createSection(
            bloc: bloc,
            outSectionStream: outSectionStream,
            sectionData: sectionData,
            sectionIndex: index);

        slivers.add(section);
      });

    final form = CustomScrollView(slivers: slivers);

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

          final section = _createSectionSliver(
              bloc: bloc,
              sectionData: snapshot.data,
              sectionIndex: sectionIndex);

          return section;
        });

    return section;
  }

  Widget _createSectionSliver(
      {@required T bloc,
      @required StreamableFormSectionData sectionData,
      @required int sectionIndex}) {
    final delegate =
        SliverChildBuilderDelegate((BuildContext context, int index) {
      final initialFieldData = sectionData.fieldData[index];

      final outFieldStream =
          bloc.outField.where((data) => data.key == initialFieldData.key);

      final field = _createField(
          outFieldStream: outFieldStream,
          fieldData: initialFieldData,
          fieldIndex: index,
          sectionIndex: sectionIndex);

      return field;
    }, childCount: sectionData.fieldData.length);

    final sectionSliver = SliverList(delegate: delegate);
    return sectionSliver;
  }

  Widget _createField(
      {@required Stream outFieldStream,
      @required StreamableFormFieldData fieldData,
      @required int fieldIndex,
      @required int sectionIndex}) {
    return StreamBuilder<StreamableFormFieldData>(
        stream: outFieldStream,
        initialData: fieldData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return SliverToBoxAdapter();
          final row = buildField(
              fieldData: snapshot.data,
              fieldIndex: fieldIndex,
              sectionIndex: sectionIndex);

          if (row == null) return _empty();

          return row;
        });
  }

  Widget _empty() => SliverToBoxAdapter();
}

typedef _FieldBuilder = Widget Function(
    {@required StreamableFormFieldData fieldData,
    int fieldIndex,
    int sectionIndex});

typedef _FormSectionHeaderBuilder = Widget Function(
    {@required StreamableFormSectionHeaderData headerData, int sectionIndex});
