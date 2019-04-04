import 'package:meta/meta.dart';

import '../utils/index.dart';
import '../mixins/index.dart';
import '../key.dart' as _key;

import 'bank_owner_reference.dart';

class ExpensePart with Mappable {
  final int amount;
  final BankOwnerReference splitter;
  final BankOwnerReference payer;

  ExpensePart({this.amount, this.splitter, this.payer});

  factory ExpensePart.fromMap(Map<String, Object> map) {
    return ExpensePart(
        amount: map[_key.amount],
        splitter: BankOwnerReference.fromMap(map[_key.splitter]),
        payer: BankOwnerReference.fromMap(map[_key.payer]));
  }

  @override
  Map<String, Object> toMap() {
    return {
      _key.amount: amount,
      _key.splitter: splitter.toMap(),
      _key.payer: payer.toMap()
    };
  }

  String formattedPayer({
    String sessionOwnerGuid,
    @required NameDefiningObject nameDefiningObject,
    bool firstPerson = false,
  }) {
    return formatName(
        guids: [payer.guid],
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        firstPerson: firstPerson);
  }

  String formattedSplitter({
    String sessionOwnerGuid,
    @required NameDefiningObject nameDefiningObject,
    bool firstPerson = false,
  }) {
    return formatName(
        guids: [splitter.guid],
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        firstPerson: firstPerson);
  }
}
