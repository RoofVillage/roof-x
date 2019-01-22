import 'package:flutter/material.dart';
import 'package:stream/bloc_provider.dart';

import './bloc.dart';
import './data/index.dart';

abstract class StreamForm<
    T extends StreamFormBloc,
    U extends StreamableFormFieldData,
    V extends StreamableFormSectionHeaderData> extends StatelessWidget {
  Widget build(BuildContext context) {
    final table = _StreamForm<T>(
        buildField: buildField, buildSectionHeader: buildSectionHeader);
    return table;
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
        final shouldShowSectionHeader = sectionData.headerData != null &&
            sectionData.fieldData.isNotEmpty &&
            buildSectionHeader != null;

        //Add the header if needed.
        if (shouldShowSectionHeader) {
          final sectionHeader = buildSectionHeader(
              headerData: sectionData.headerData, sectionIndex: index);
          slivers.add(sectionHeader);
        }

        final stream =
            bloc.outSection.where((data) => data.key == sectionData.key);

        final sectionWidget = StreamBuilder<StreamableFormSectionData>(
            stream: stream,
            initialData: sectionData,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container(child: Text("Doo"));

              final section = _createSectionSliver(
                  bloc: bloc,
                  context: context,
                  sectionData: snapshot.data,
                  sectionIndex: index);

              return section;
            });

        slivers.add(sectionWidget);
      });

    final form = CustomScrollView(slivers: slivers);

    return form;
  }

  Widget _createSectionSliver(
      {@required T bloc,
      @required BuildContext context,
      @required StreamableFormSectionData sectionData,
      @required int sectionIndex}) {
    final gridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: double.infinity);

    final delegate =
        SliverChildBuilderDelegate((BuildContext context, int index) {
      final initialRowData = sectionData.fieldData[index];
      final stream =
          bloc.outField.where((data) => data.key == initialRowData.key);

      return StreamBuilder<StreamableFormFieldData>(
          stream: stream,
          initialData: initialRowData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container(child: Text("Goo"));
            return buildField(
                fieldData: snapshot.data,
                fieldIndex: index,
                sectionIndex: sectionIndex);
          });
    }, childCount: sectionData.fieldData.length);

    final sectionSliver = SliverGrid(
      gridDelegate: gridDelegate,
      delegate: delegate,
    );

    return sectionSliver;
  }
}

typedef _FieldBuilder = Widget Function(
    {@required StreamableFormFieldData fieldData,
    int fieldIndex,
    int sectionIndex});

typedef _FormSectionHeaderBuilder = Widget Function(
    {@required StreamableFormSectionHeaderData headerData, int sectionIndex});
