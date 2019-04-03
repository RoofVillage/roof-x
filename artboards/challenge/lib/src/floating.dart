import 'dart:async';

import 'package:floating_artboard_templates/index.dart';
import 'package:flutter/material.dart';

import '_builder.dart';

class ChallengeFloatingArtboard extends FormFloatingArtboard
    with ChallengeArtboardBuilder {
  final String phoneNumber;
  ChallengeFloatingArtboard({this.phoneNumber});

  @override
  Future<void> submit(BuildContext context) async {
    ///do work;
    return;
  }
}
