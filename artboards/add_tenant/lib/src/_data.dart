import 'dart:async';

import 'package:form_builder/index.dart';

mixin AddTenantArtboardData implements FormBuilder {
  @override
  String get title => "Add a tenant";

  @override
  String get subtitle =>
      "Add a tenant's name and create a key that they can use to join this lease. You can still manually log payments from tenants before they actually join.";

  @override
  String get submitButtonText => "Add tenant";

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _name,
        _inviteNow,
        _contact,
      ];

  final _name = FormShortTextFieldData(title: "Name");
  final _inviteNow = FormSwitchFieldData(title: "Invite now by email or text");
  // TODO visible if inviteNow.value == true
  final _contact = FormShortTextFieldData(title: "Send invite to...");
}
