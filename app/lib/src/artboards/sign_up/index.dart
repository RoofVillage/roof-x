import 'package:flutter/material.dart';
import 'package:artboard_templates/index.dart';
import 'package:roof_form/index.dart';
import 'package:artboard_navigators/index.dart';

import '../public_activity/index.dart';

class SignUp extends FormFloatingArtboard {
  WidgetBuilder get buildBody => (context) => _SignUpForm();

  @override
  String get title => "Gucci";

  @override
  String get subtitle => "Yamagucci";

  @override
  get submitButtonText => "Next";
  get submitButtonAction => (context) {
        ArtboardNavigator.of(context).goTo(SignUp(), context: context);
      };

  get threadButtonText => "Thread";
  get threadButtonAction => (context) {
        ArtboardNavigator.of(context).goTo(PublicActivity(), context: context);
      };

  get backButtonText => "Back";
  get backButtonAction => (context) {
        ArtboardNavigator.of(context).goTo(PublicActivity(), context: context);
      };
}

class _SignUpForm extends RoofStreamForm {
  final _nameFieldData = FormTextFieldData(
      size: 1 / 2,
      title: "Full name",
      onChanged: (someString) => print(someString));
  final _pooFieldData = FormTextFieldData(
      size: 1 / 2,
      title: "Goo name",
      onChanged: (someString) => print(someString));

  @override
  Future<StreamableFormData> get initialFormData async {
    final formData = SpacedStreamableFormData.withFields(
        fieldData: [_nameFieldData, _pooFieldData]);
    return formData;
  }
}
