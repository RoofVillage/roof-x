import 'package:flutter/material.dart';

import 'package:roofui_kit/list/roofui_list.dart';
import 'package:roofui_kit/cell/a/roofui_cell_a.dart';

import '../bloc/_auth_bloc.dart';
import '../data/_public_activity_data.dart';

class AuthList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoofUIList<AuthBloc, PublicActivityData>(builder: (data) {
      return RoofUICellA(
          titleText: data.title,
          detailText: data.description,
          iconReference: data.iconReference);
    });
  }
}
