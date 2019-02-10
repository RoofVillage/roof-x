import 'package:types/index.dart';
import '../abstract/index.dart';
import '../properties/index.dart';
import '../utils/index.dart';

class User extends ModelObject {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final List<NameDomain> nameDomains;
  final List<NameContract> nameContracts;
  final List<NamePaymentProfile> namePaymentProfiles;
  final List<PaymentDefault> paymentDefaults;
  final PrivacyType privacyType;
  final bool tfaEnabled;
  final bool textNotificationsEnabled;
  final int badgeCount;
  final List<NotificationUnsubscribeType> notificationUnsubscribes;
  final List<EmailUnsubscribeType> emailUnsubscribes;
  final Billing billing;

  const User(
      {String guid,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.nameDomains,
      this.nameContracts,
      this.namePaymentProfiles,
      this.paymentDefaults,
      this.privacyType,
      this.tfaEnabled,
      this.textNotificationsEnabled,
      this.badgeCount,
      this.notificationUnsubscribes,
      this.emailUnsubscribes,
      this.billing})
      : super(guid: guid);

  factory User.fromMap(Map<String, Object> map) {
    final object = ModelObject.fromMap(map);
    final name = map[Key.name] as Map;
    final nameDomains =
        (map[Key.domains] as List).map((map) => NameDomain.fromMap(map));
    final nameContracts =
        (map[Key.domains] as List).map((map) => NameContract.fromMap(map));
    final namePaymentProfiles = (map[Key.paymentProfiles] as List)
        .map((map) => NamePaymentProfile.fromMap(map));
    final paymentDefaults = (map[Key.paymentDefaults] as List)
        .map((map) => PaymentDefault.fromMap(map));
    final emailUnsubscribes = (map[Key.emailUnsubscribes] as List).map(
        (emailUnsubscribe) => EmailUnsubscribeType.values.firstWhere((value) =>
            value.toString() == 'EmailUnsubscribeType.' + emailUnsubscribe));
    final notificationUnsubscribes = (map[Key.notificationUnsubscribes] as List)
        .map((notificationUnsubscribe) => NotificationUnsubscribeType.values
            .firstWhere((value) =>
                value.toString() ==
                'NotificationUnsubscribeType.' + notificationUnsubscribe));
    final billing = Billing.fromMap(map[Key.billing]);

    return User(
        guid: object.guid,
        firstName: name[Key.first],
        lastName: name[Key.last],
        email: map[Key.email],
        phoneNumber: map[Key.phoneNumber],
        nameDomains: nameDomains,
        nameContracts: nameContracts,
        namePaymentProfiles: namePaymentProfiles,
        paymentDefaults: paymentDefaults,
        privacyType: map[Key.defaultPrivacyKind],
        tfaEnabled: map[Key.tfaEnabled],
        textNotificationsEnabled: map[Key.textNotificationsEnabled],
        badgeCount: map[Key.badgeCount],
        notificationUnsubscribes: notificationUnsubscribes,
        emailUnsubscribes: emailUnsubscribes,
        billing: billing);
  }

  @override
  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      Key.name: {Key.first: firstName, Key.last: lastName},
      Key.email: email,
      Key.phoneNumber: phoneNumber,
      Key.domains: nameDomains.map((nameDomain) => nameDomain.toMap()),
      Key.contracts: nameContracts.map((nameContract) => nameContract.toMap()),
      Key.paymentProfiles: namePaymentProfiles
          .map((namePaymentProfile) => namePaymentProfile.toMap()),
      Key.paymentDefaults:
          paymentDefaults.map((paymentDefaults) => paymentDefaults.toMap()),
      Key.defaultPrivacyKind: privacyType.toString().split(".").last,
      Key.tfaEnabled: tfaEnabled,
      Key.textNotificationsEnabled: textNotificationsEnabled,
      Key.badgeCount: badgeCount,
      Key.notificationUnsubscribes: notificationUnsubscribes.map(
          (notificationUnsubscribe) =>
              notificationUnsubscribe.toString().split(".").last),
      Key.emailUnsubscribes: emailUnsubscribes.map(
          (emailUnsubscribe) => emailUnsubscribe.toString().split(".").last),
      Key.billing: billing.toMap()
    });

    return map;
  }
}
