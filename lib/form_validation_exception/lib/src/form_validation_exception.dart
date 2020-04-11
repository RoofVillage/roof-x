import 'package:meta/meta.dart';

class FormValidationException implements Exception {
  final String message;

  factory FormValidationException.badEmail() => FormValidationException(
        "Looks like this email isn't valid. Reach out to us if you think we've got it wrong.",
      );

  factory FormValidationException.badPhoneNumber() => FormValidationException(
        "Looks like this phone number isn't valid. Reach out to us if you think we've got it wrong.",
      );

  factory FormValidationException.badSsn() => FormValidationException(
        "Looks like this social security number (SSN) isn't valid. Reach out to us if you think we've got it wrong.",
      );

  factory FormValidationException.badEin() => FormValidationException(
        "Looks like this employer identificiation number (EIN) isn't valid. Reach out to us if you think we've got it wrong.",
      );

  factory FormValidationException.longPassword({@required int max}) =>
      FormValidationException(
        "This password is too long. Try something under $max characters.",
      );

  factory FormValidationException.unsafePassword() => FormValidationException(
        "This password isn't safe enough. Try something with a letter, number, and symbol over 8 characters long.",
      );

  factory FormValidationException.incompleteName() => FormValidationException(
        "Both your first and last names please!",
      );

  factory FormValidationException.tooLongString({
    @required String fieldTitle,
    @required int max,
  }) =>
      FormValidationException(
        "$fieldTitle is too long. Try something under $max characters.",
      );

  factory FormValidationException.tooShortString({
    @required String fieldTitle,
    @required int min,
  }) =>
      FormValidationException(
        "$fieldTitle is too short. Try something with at least $min characters.",
      );

  factory FormValidationException.maxValue({
    @required String fieldTitle,
    @required double maxValue,
  }) =>
      FormValidationException(
        "$fieldTitle must be less than $maxValue",
      );

  factory FormValidationException.emptyNotAllowed(
          {@required String fieldTitle}) =>
      FormValidationException(
        "$fieldTitle can't be empty.",
      );

  FormValidationException(this.message);
}
