import 'package:consts/index.dart';

class ValidationErrors {
  static const String badEmail =
      "Looks like this email isn't valid. Reach out to us if you think we've got it wrong.";
  static const String longPassword =
      "This password is too long. Try something under ${Consts.maxCharsInPassword} characters.";
  static const String shortPassword =
      "This password is too short. Try something at least ${Consts.minCharsInPassword} characters long.";
  static const String unsafePassword =
      "This password isn't safe enough. Try something with a letter, number, and symbol over 8 characters long.";
  static const String incompleteName = "Add your first and last name please!";

  static String longSmallString(String fieldTitle) {
    return "$fieldTitle is too long. Try something under ${Consts.maxCharsInSmallTextField} characters.";
  }

  static String longMediumString(String fieldTitle) {
    return "$fieldTitle is too long. Try something under ${Consts.maxCharsInMediumTextField} characters.";
  }

  static String longLongString(String fieldTitle) {
    return "$fieldTitle is too long. Try something under ${Consts.maxCharsInLongTextField} characters.";
  }
}
