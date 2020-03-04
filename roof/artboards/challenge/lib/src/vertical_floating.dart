import 'dart:async';

import 'package:form_vertical_floating_artboard_template/index.dart';
import 'package:flutter/material.dart';

import '_data.dart';

class ChallengeVerticalFloatingArtboard extends FormVerticalFloatingArtboard
    with ChallengeArtboardData {
  final String phoneNumber;
  ChallengeVerticalFloatingArtboard({this.phoneNumber});

  @override
  Future<void> submit(BuildContext context) async {
    ///do work;
    return;
  }
}
