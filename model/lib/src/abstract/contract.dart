import 'package:types/index.dart';
import 'package:date/index.dart';
import '../utils/index.dart';

import '../properties/index.dart';
import '_context.dart';

class Contract extends Context {
  final Date startDate;
  final Date endDate;
  final String name;
  final int amount;
  final List<ContractUser> users;
  final List<ContractUser> formerUsers;
  final Schedule schedule;
  final NameContractDomain domain;
  final int invoiceCount;
  final FeePayerType feePayerType;
  final bool monthToMonth;

  Contract(
      {int unreadCommentableObjectCount,
      int pinnedCommentableObjectCount,
      this.startDate,
      this.endDate,
      this.name,
      this.amount,
      this.users,
      this.formerUsers,
      this.schedule,
      this.domain,
      this.invoiceCount,
      this.feePayerType,
      this.monthToMonth})
      : super(
          unreadCommentableObjectCount: unreadCommentableObjectCount,
          pinnedCommentableObjectCount: pinnedCommentableObjectCount,
        );

  factory Contract.fromMap(Map<String, Object> map) {
    final context = Context.fromMap(map);
    final counts = map[Key.counts] as Map;

    final users =
        (map[Key.users] as List).map((map) => ContractUser.fromMap(map));

    final formerUsers =
        (map[Key.formerUsers] as List).map((map) => ContractUser.fromMap(map));

    return Contract(
        unreadCommentableObjectCount: context.unreadCommentableObjectCount,
        pinnedCommentableObjectCount: context.pinnedCommentableObjectCount,
        invoiceCount: counts[Key.invoice],
        startDate: Date.fromSecondsSinceEpoch(map[Key.startTimestamp]),
        endDate: Date.fromSecondsSinceEpoch(map[Key.endTimestamp]),
        name: map[Key.name],
        amount: map[Key.amount],
        users: users,
        formerUsers: formerUsers,
        schedule: Schedule.fromMap(map[Key.schedule]),
        domain: NameContractDomain.fromMap(map[Key.domain]),
        feePayerType: FeePayerType.values.firstWhere((value) =>
            value.toString() == 'FeePayerType.' + map[Key.feePayerKind]),
        monthToMonth: map[Key.monthToMonth]);
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    (map[Key.counts] as Map).addAll({Key.invoice: invoiceCount});

    map.addAll({
      Key.startTimestamp: startDate.secondsSinceEpoch,
      Key.endTimestamp: endDate.secondsSinceEpoch,
      Key.name: name,
      Key.amount: amount,
      Key.users: users.map((user) => user.toMap()),
      Key.formerUsers: users.map((formerUsers) => formerUsers.toMap()),
      Key.schedule: schedule.toMap(),
      Key.domain: domain.toMap(),
      Key.feePayerKind: feePayerType.toString().split(".").last,
      Key.monthToMonth: monthToMonth
    });

    return map;
  }
}
