import 'package:dwolla_model/src/_utils.dart';
import 'package:dwolla_model/src/passport.dart';
import 'package:dwolla_types/index.dart';

import './address.dart';

class Controller {
  final String firstName;
  final String lastName;
  final String title;
  final DateTime dateOfBirth;
  final String ssn;
  final Address address;
  final Passport passport;
  final ControllerVerificationStatus status;

  Controller({
    this.firstName,
    this.lastName,
    this.title,
    this.dateOfBirth,
    this.ssn,
    this.address,
    this.passport,
    this.status,
  }) : assert(ssn.length == 4);

  Map<String, Object> get asMap => {
        'firstName': firstName,
        'lastName': lastName,
        'title': title,
        'dateOfBirth': formatDateOfBirth(dateOfBirth),
        'ssn': ssn,
        'address': address.asMap,
        'passport': passport.asMap,
      };
}
