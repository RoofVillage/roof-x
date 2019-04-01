import 'package:consts/index.dart';

class FormValidationException implements Exception {
  final String message;

  static const badEmail = FormValidationException(
      "Looks like this email isn't valid. Reach out to us if you think we've got it wrong.");

  static const badPhoneNumber = FormValidationException(
      "Looks like this phone number isn't valid. Reach out to us if you think we've got it wrong.");

  static const longPassword = FormValidationException(
      "This password is too long. Try something under $maxCharsInPassword characters.");

  static const shortPassword = FormValidationException(
      "This password is too short. Try something at least $minCharsInPassword characters long.");

  static const unsafePassword = FormValidationException(
      "This password isn't safe enough. Try something with a letter, number, and symbol over 8 characters long.");

  static const incompleteName =
      FormValidationException("Add your first and last name please!");

  static FormValidationException longSmallString(String fieldTitle) {
    return FormValidationException(
        "$fieldTitle is too long. Try something under $maxCharsInSmallTextField characters.");
  }

  static FormValidationException longMediumString(String fieldTitle) {
    return FormValidationException(
        "$fieldTitle is too long. Try something under $maxCharsInMediumTextField characters.");
  }

  static FormValidationException longLongString(String fieldTitle) {
    return FormValidationException(
        "$fieldTitle is too long. Try something under $maxCharsInLongTextField characters.");
  }

  const FormValidationException(this.message);
}
