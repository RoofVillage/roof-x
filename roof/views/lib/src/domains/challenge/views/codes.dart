import 'package:blossm_view_store/index.dart';
import 'package:views/src/domains/challenge/challenge_domain_config.dart';

class CodesViewStore
    with BlossmViewStore<CodesView, List>, ChallengeDomainConfig {
  @override
  String get route => "codes";

  @override
  CodesView Function(List) get viewFromHttpResponse => (List list) {
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

        return CodesView(codes: codes);
      };
}

class CodesView {
  final List<ChallengeCode> codes;

  CodesView({this.codes});
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
