import 'package:flutter/material.dart';
import 'package:roofui_kit/cell/a/index.dart';
import 'package:roof/util/bloc_provider.dart';

import '../data/public_activity_data.dart';
import '../bloc/auth_bloc.dart';

class AuthList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return StreamBuilder<List<PublicActivityData>>(
        stream: authBloc.outList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();

          final list = snapshot.data;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              final initialData = list[index];
              return StreamBuilder<PublicActivityData>(
                  stream: authBloc.outData
                      .where((data) => data.id == initialData.id),
                  initialData: initialData,
                  builder: (context, snapshot) {
                    final dataItem = snapshot.data;
                    return RoofUICellA(
                        titleText: dataItem.title,
                        detailText: dataItem.description,
                        iconReference: dataItem.iconReference);
                  });
            },
          );
        });
  }
}
