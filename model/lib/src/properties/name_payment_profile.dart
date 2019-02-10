import '../utils/index.dart';

class NamePaymentProfile extends Mappable {
  final String guid;
  final String nickname;
  final String bankNickname;
  final String bankGuid;
  final String bankStatusType;
  final String authorizationEmail;
  final bool authorizationCompleted;

  NamePaymentProfile(
      {this.guid,
      this.nickname,
      this.bankNickname,
      this.bankGuid,
      this.bankStatusType,
      this.authorizationEmail,
      this.authorizationCompleted});

  factory NamePaymentProfile.fromMap(Map<String, Object> map) {
    return NamePaymentProfile(
        guid: map[Key.guid],
        nickname: map[Key.nickname],
        bankNickname: map[Key.bankNickname],
        bankGuid: map[Key.bankGuid],
        bankStatusType: map[Key.bankStatusKind],
        authorizationEmail: map[Key.authorizationEmail]);
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.guid: guid,
      Key.nickname: nickname,
      Key.bankNickname: bankNickname,
      Key.bankGuid: bankGuid,
      Key.bankStatusKind: bankStatusType,
      Key.authorizationEmail: authorizationEmail
    };
  }
}
