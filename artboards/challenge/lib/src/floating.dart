import 'dart:async';

import 'package:vertical_floating_artboard_templates/index.dart';
import 'package:flutter/material.dart';

import '_builder.dart';

class ChallengeVerticalFloatingArtboard extends FormVerticalFloatingArtboard
    with ChallengeArtboardBuilder {
  final String phoneNumber;
  ChallengeVerticalFloatingArtboard({this.phoneNumber});

  @override
  Future<void> submit(BuildContext context) async {
    ///do work;
    return;
  }
}
