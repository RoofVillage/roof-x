import '../index.dart';

enum _UsStateOption {
  alabama,
  alaska,
  arizona,
  arkansas,
  california,
  colorado,
  connecticut,
  delaware,
  districtOfColumbia,
  florida,
  georgia,
  hawaii,
  idaho,
  illinois,
  indiana,
  iowa,
  kansas,
  kentucky,
  louisiana,
  maine,
  maryland,
  massachusetts,
  michigan,
  minnesota,
  mississippi,
  missouri,
  montana,
  nebraska,
  nevada,
  newHampshire,
  newJersey,
  newMexico,
  newYork,
  northCarolina,
  northDakota,
  ohio,
  oklahoma,
  oregon,
  pennsylvania,
  rhodeIsland,
  southCarolina,
  southDakota,
  tennessee,
  texas,
  utah,
  vermont,
  virginia,
  washington,
  westVirginia,
  wisconsin,
  wyoming,
}

class UsStateOption {
  final _UsStateOption _value;
  const UsStateOption._internal(this._value);
  factory UsStateOption.fromString(String string) {
    final _string = string.toLowerCase();

    final option = _UsStateOption.values.firstWhere(
      (value) =>
          UsStateOption._internal(value).toAbbreviatedString().toLowerCase() ==
              _string ||
          UsStateOption._internal(value).toFullString().toLowerCase() ==
              _string,
    );

    return UsStateOption._internal(option);
  }

  static List<UsStateOption> get options => _UsStateOption.values
      .map((value) => UsStateOption._internal(value))
      .toList();

  String toFullString() {
    switch (_value) {
      case _UsStateOption.alabama:
        return 'Alabama';
      case _UsStateOption.alaska:
        return 'Alaska';
      case _UsStateOption.arizona:
        return 'Arizona';
      case _UsStateOption.arkansas:
        return 'Arkansas';
      case _UsStateOption.california:
        return 'California';
      case _UsStateOption.colorado:
        return 'Colorado';
      case _UsStateOption.connecticut:
        return 'Connecticut';
      case _UsStateOption.delaware:
        return 'Delaware';
      case _UsStateOption.districtOfColumbia:
        return 'District of Columbia';
      case _UsStateOption.florida:
        return 'Florida';
      case _UsStateOption.georgia:
        return 'Georgia';
      case _UsStateOption.hawaii:
        return 'Hawaii';
      case _UsStateOption.idaho:
        return 'Idaho';
      case _UsStateOption.illinois:
        return 'Illinois';
      case _UsStateOption.indiana:
        return 'Indiana';
      case _UsStateOption.iowa:
        return 'Iowa';
      case _UsStateOption.kansas:
        return 'Kansas';
      case _UsStateOption.kentucky:
        return 'Kentucky';
      case _UsStateOption.louisiana:
        return 'Louisiana';
      case _UsStateOption.maine:
        return 'Maine';
      case _UsStateOption.maryland:
        return 'Maryland';
      case _UsStateOption.massachusetts:
        return 'Massachusetts';
      case _UsStateOption.michigan:
        return 'Michigan';
      case _UsStateOption.minnesota:
        return 'Minnesota';
      case _UsStateOption.mississippi:
        return 'Mississippi';
      case _UsStateOption.missouri:
        return 'Missouri';
      case _UsStateOption.montana:
        return 'Montana';
      case _UsStateOption.nebraska:
        return 'Nebraska';
      case _UsStateOption.nevada:
        return 'Nevada';
      case _UsStateOption.newHampshire:
        return 'New Hampshire';
      case _UsStateOption.newJersey:
        return 'New Jersey';
      case _UsStateOption.newMexico:
        return 'New Mexico';
      case _UsStateOption.newYork:
        return 'New York';
      case _UsStateOption.northCarolina:
        return 'North Carolina';
      case _UsStateOption.northDakota:
        return 'North Dakota';
      case _UsStateOption.ohio:
        return 'Ohio';
      case _UsStateOption.oklahoma:
        return 'Oklahoma';
      case _UsStateOption.oregon:
        return 'Oregon';
      case _UsStateOption.pennsylvania:
        return 'Pennsylvania';
      case _UsStateOption.rhodeIsland:
        return 'Rhode Island';
      case _UsStateOption.southCarolina:
        return 'South Carolina';
      case _UsStateOption.southDakota:
        return 'South Dakota';
      case _UsStateOption.tennessee:
        return 'Tennessee';
      case _UsStateOption.texas:
        return 'Texas';
      case _UsStateOption.utah:
        return 'Utah';
      case _UsStateOption.vermont:
        return 'Vermont';
      case _UsStateOption.virginia:
        return 'Virginia';
      case _UsStateOption.washington:
        return 'Washington';
      case _UsStateOption.westVirginia:
        return 'West Virginia';
      case _UsStateOption.wisconsin:
        return 'Wisconsin';
      case _UsStateOption.wyoming:
        return 'Wyoming';
    }
    return null;
  }

  String toAbbreviatedString() {
    switch (_value) {
      case _UsStateOption.alabama:
        return 'AL';
      case _UsStateOption.alaska:
        return 'AK';
      case _UsStateOption.arizona:
        return 'AZ';
      case _UsStateOption.arkansas:
        return 'AR';
      case _UsStateOption.california:
        return 'CA';
      case _UsStateOption.colorado:
        return 'CO';
      case _UsStateOption.connecticut:
        return 'CT';
      case _UsStateOption.delaware:
        return 'DE';
      case _UsStateOption.districtOfColumbia:
        return 'DC';
      case _UsStateOption.florida:
        return 'FL';
      case _UsStateOption.georgia:
        return 'GA';
      case _UsStateOption.hawaii:
        return 'HI';
      case _UsStateOption.idaho:
        return 'ID';
      case _UsStateOption.illinois:
        return 'IL';
      case _UsStateOption.indiana:
        return 'IN';
      case _UsStateOption.iowa:
        return 'IA';
      case _UsStateOption.kansas:
        return 'KS';
      case _UsStateOption.kentucky:
        return 'KY';
      case _UsStateOption.louisiana:
        return 'LA';
      case _UsStateOption.maine:
        return 'ME';
      case _UsStateOption.maryland:
        return 'MD';
      case _UsStateOption.massachusetts:
        return 'MA';
      case _UsStateOption.michigan:
        return 'MI';
      case _UsStateOption.minnesota:
        return 'MN';
      case _UsStateOption.mississippi:
        return 'MS';
      case _UsStateOption.missouri:
        return 'MO';
      case _UsStateOption.montana:
        return 'MT';
      case _UsStateOption.nebraska:
        return 'NE';
      case _UsStateOption.nevada:
        return 'NV';
      case _UsStateOption.newHampshire:
        return 'NH';
      case _UsStateOption.newJersey:
        return 'NJ';
      case _UsStateOption.newMexico:
        return 'NM';
      case _UsStateOption.newYork:
        return 'NY';
      case _UsStateOption.northCarolina:
        return 'NC';
      case _UsStateOption.northDakota:
        return 'ND';
      case _UsStateOption.ohio:
        return 'OH';
      case _UsStateOption.oklahoma:
        return 'OK';
      case _UsStateOption.oregon:
        return 'OR';
      case _UsStateOption.pennsylvania:
        return 'PA';
      case _UsStateOption.rhodeIsland:
        return 'RI';
      case _UsStateOption.southCarolina:
        return 'SC';
      case _UsStateOption.southDakota:
        return 'SD';
      case _UsStateOption.tennessee:
        return 'TN';
      case _UsStateOption.texas:
        return 'TX';
      case _UsStateOption.utah:
        return 'UT';
      case _UsStateOption.vermont:
        return 'VT';
      case _UsStateOption.virginia:
        return 'VA';
      case _UsStateOption.washington:
        return 'WA';
      case _UsStateOption.westVirginia:
        return 'WV';
      case _UsStateOption.wisconsin:
        return 'WI';
      case _UsStateOption.wyoming:
        return 'WY';
    }
    return null;
  }

  static List<String> get fullStringOptions => _UsStateOption.values
      .map((val) => UsStateOption._internal(val).toFullString())
      .toList();

  static List<String> get abbrevStringOptions => _UsStateOption.values
      .map((val) => UsStateOption._internal(val).toAbbreviatedString())
      .toList();
}
