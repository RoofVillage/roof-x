import 'dart:async';

import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:navigation/index.dart';
import 'package:reset_password_artboard/index.dart';

import '_builder.dart';

class LogInFloatingArtboard extends FormFloatingArtboard
    with LogInArtboardBuilder {
  @override
  Future<void> submit(BuildContext context) async {
    ArtboardNavigator.of(context).goTo(ResetPasswordFloatingArtboard());
  }
}
