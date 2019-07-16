import 'dart:async';

import 'package:form_builder/index.dart';

mixin MessageCreateArtboardData implements FormBuilder {
  @override
  String get title => "New message";

  @override
  String get subtitle =>
      "Everyone on this lease will see this and be able to respond.";

  @override
  String get submitButtonText => "Send message";

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _subject,
        _note,
      ];

  final _subject = FormShortTextFieldData(title: "Subject");
  final _note = FormTextAreaData(title: "Message");
}
