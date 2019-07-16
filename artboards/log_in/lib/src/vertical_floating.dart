import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_vertical_floating_artboard_template/index.dart';
import 'package:navigator/index.dart';
import 'package:reset_password_artboard/index.dart';

import '_data.dart';

class LogInVerticalFloatingArtboard extends FormVerticalFloatingArtboard
    with LogInArtboardData {
  @override
  Future<void> submit(BuildContext context) async {
    ArtboardNavigator.of(context).goTo(ResetPasswordVerticalFloatingArtboard());
  }
}
