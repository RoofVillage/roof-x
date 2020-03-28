import 'package:dwolla_model/src/passport.dart';

import '_utils.dart';
import './address.dart';

class BeneficialOwner {
  final String firstName;
  final String lastName;
  final String ssn;
  final DateTime dateOfBirth;
  final Address address;
  final Passport passport;

  BeneficialOwner({
    this.firstName,
    this.lastName,
    // Social security number (only last 4 digits)
    this.ssn,
    this.dateOfBirth,
    this.address,
    this.passport,
  }) : assert(ssn.length == 4);

  Map<String, Object> get asMap => {
        'firstName': firstName,
        'lastName': lastName,
        'ssn': ssn,
        'dateOfBirth': formatDateOfBirth(dateOfBirth),
        'address': address.asMap,
        'passport': passport.asMap,
      };
}
