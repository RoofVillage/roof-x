import 'package:date/index.dart';
import 'package:meta/meta.dart';
import 'package:types/index.dart';
import '../abstract/index.dart';
import '../properties/index.dart';
import '../utils/index.dart';

class User extends ModelObject {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final Set<NameDomain> nameDomains;
  final Set<NameContract> nameContracts;
  final Set<NamePaymentProfile> namePaymentProfiles;
  final Set<PaymentDefault> paymentDefaults;
  final PrivacyType privacyType;
  final bool tfaEnabled;
  final bool textNotificationsEnabled;
  final int badgeCount;
  final Set<NotificationCategoryType> notificationUnsubscribes;
  final Set<EmailCategoryType> emailUnsubscribes;
  final Billing billing;

  const User(
      {@required String guid,
      @required Date dateCreated,
      @required String creatorGuid,
      @required this.firstName,
      @required this.lastName,
      @required this.email,
      this.phoneNumber,
      @required this.nameDomains,
      @required this.nameContracts,
      @required this.namePaymentProfiles,
      @required this.paymentDefaults,
      @required this.privacyType,
      @required this.tfaEnabled,
      @required this.textNotificationsEnabled,
      @required this.badgeCount,
      @required this.notificationUnsubscribes,
      @required this.emailUnsubscribes,
      @required this.billing})
      : assert(firstName != null),
        assert(lastName != null),
        assert(email != null),
        assert(nameDomains != null),
        assert(nameContracts != null),
        assert(namePaymentProfiles != null),
        assert(paymentDefaults != null),
        assert(privacyType != null),
        assert(tfaEnabled != null),
        assert(textNotificationsEnabled != null),
        assert(badgeCount != null),
        assert(notificationUnsubscribes != null),
        assert(emailUnsubscribes != null),
        assert(billing != null),
        super(guid: guid, dateCreated: dateCreated, creatorGuid: creatorGuid);

  static User fromMap(Map<String, Object> map) {
    assert(map != null);

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
        (emailUnsubscribe) => EmailCategoryType.fromString(emailUnsubscribe));
    final notificationUnsubscribes = (map[Key.notificationUnsubscribes] as List)
        .map((notificationUnsubscribe) =>
            NotificationCategoryType.fromString(notificationUnsubscribe));
    final billing = Billing.fromMap(map[Key.billing]);

    return User(
        guid: object.guid,
        dateCreated: object.dateCreated,
        creatorGuid: object.creatorGuid,
        firstName: name[Key.first],
        lastName: name[Key.last],
        email: map[Key.email],
        phoneNumber: map[Key.phoneNumber],
        nameDomains: nameDomains.toSet(),
        nameContracts: nameContracts.toSet(),
        namePaymentProfiles: namePaymentProfiles.toSet(),
        paymentDefaults: paymentDefaults.toSet(),
        privacyType: map[Key.defaultPrivacyKind],
        tfaEnabled: map[Key.tfaEnabled],
        textNotificationsEnabled: map[Key.textNotificationsEnabled],
        badgeCount: map[Key.badgeCount] ?? 0,
        notificationUnsubscribes: notificationUnsubscribes.toSet(),
        emailUnsubscribes: emailUnsubscribes.toSet(),
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
      Key.defaultPrivacyKind: privacyType.toString(),
      Key.tfaEnabled: tfaEnabled,
      Key.textNotificationsEnabled: textNotificationsEnabled,
      Key.badgeCount: badgeCount,
      Key.notificationUnsubscribes: notificationUnsubscribes
          .map((notificationUnsubscribe) => notificationUnsubscribe.toString()),
      Key.emailUnsubscribes: emailUnsubscribes
          .map((emailUnsubscribe) => emailUnsubscribe.toString()),
      Key.billing: billing.toMap()
    });

    return map;
  }
}
