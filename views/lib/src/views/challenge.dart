import 'package:views/src/view_store.dart';

class ChallengeViewStore with ViewStore<ChallengeView, List> {
  @override
  String get domain => "challenge";

  @override
  String get route => "codes";

  @override
  ChallengeView Function(List) get viewFromHttpResponse => (List list) {
        final List<ChallengeCode> codes = List.from(
          list.map(
            (obj) => ChallengeCode(
              id: obj["id"],
              code: obj["code"],
              created: DateTime.tryParse(obj["created"]),
              expires: DateTime.tryParse(obj["expires"]),
              modified: DateTime.tryParse(obj["modified"]),
              version: obj["version"],
            ),
          ),
        );

        return ChallengeView(codes: codes);
      };
}

class ChallengeView {
  final List<ChallengeCode> codes;

  ChallengeView({this.codes});
}

class ChallengeCode {
  final String id;
  final String code;
  final DateTime created;
  final DateTime expires;
  final DateTime modified;
  final int version;

  ChallengeCode({
    this.id,
    this.code,
    this.created,
    this.expires,
    this.modified,
    this.version,
  });
}
