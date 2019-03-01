import 'package:meta/meta.dart';

import '../utils/index.dart';
import '../mixins/index.dart';

import 'bank_owner_reference.dart';

class ExpensePart extends Mappable {
  final int amount;
  final BankOwnerReference splitter;
  final BankOwnerReference payer;

  ExpensePart({this.amount, this.splitter, this.payer});

  factory ExpensePart.fromMap(Map<String, Object> map) {
    return ExpensePart(
        amount: map[Key.amount],
        splitter: BankOwnerReference.fromMap(map[Key.splitter]),
        payer: BankOwnerReference.fromMap(map[Key.payer]));
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.amount: amount,
      Key.splitter: splitter.toMap(),
      Key.payer: payer.toMap()
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
