import 'package:types/index.dart';
import '../utils/index.dart';

class Billing extends Mappable {
  final String email;
  final bool isEmailVerified;
  final String firstName;
  final String lastName;
  final BillingStatusType statusType;
  final BillingType type;
  final String address1;
  final String address2;
  final String city;
  final String postalCode;

  Billing(
      {this.email,
      this.isEmailVerified,
      this.firstName,
      this.lastName,
      this.statusType,
      this.type,
      this.address1,
      this.address2,
      this.city,
      this.postalCode});

  factory Billing.fromMap(Map<String, Object> map) {
    if (map == null) return null;

    return Billing(
        email: map[Key.email],
        isEmailVerified: map[Key.isEmailVerified],
        firstName: map[Key.firstName],
        lastName: map[Key.lastName],
        statusType: BillingStatusType.fromString(map[Key.statusKind]),
        type: BillingType.fromString(map[Key.kind]),
        address1: map[Key.address1],
        address2: map[Key.address2],
        city: map[Key.city],
        postalCode: map[Key.postalCode]);
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.email: email,
      Key.isEmailVerified: isEmailVerified,
      Key.firstName: firstName,
      Key.lastName: lastName,
      Key.statusKind: statusType.toString(),
      Key.kind: type.toString(),
      Key.address1: address1,
      Key.address2: address2,
      Key.city: city,
      Key.postalCode: postalCode
    };
  }
}
