import 'package:meta/meta.dart';
import 'package:types/index.dart';
import 'package:date/index.dart';
import '../utils/index.dart';

import '../properties/index.dart';
import 'context.dart';

class Contract extends Context {
  final Date startDate;
  final Date endDate;
  final String name;
  final int amount;
  final Set<ContractUser> users;
  final Set<ContractUser> formerUsers;
  final Schedule schedule;
  final NameContractDomain domain;
  final int invoiceCount;
  final FeePayerType feePayerType;
  final bool monthToMonth;

  @override
  Set<String> get userGuids => users.map((user) => user.guid);

  @override
  Set<String> get formerUserGuids => formerUsers.map((user) => user.guid);

  @override
  Set<NameUser> get nameUsers {
    return users.followedBy(formerUsers).toSet();
  }

  @override
  Set<NameContext> get nameContexts => Set.of([domain]);

  Contract(
      {@required String guid,
      @required Date dateCreated,
      @required String creatorGuid,
      @required int unreadCommentableObjectCount,
      @required int pinnedCommentableObjectCount,
      @required this.startDate,
      @required this.endDate,
      @required this.amount,
      this.name,
      @required this.users,
      @required this.formerUsers,
      @required this.schedule,
      this.domain,
      @required this.invoiceCount,
      @required this.feePayerType,
      @required this.monthToMonth})
      :
        //Contracts will always be user made.
        assert(creatorGuid != null),
        assert(startDate != null),
        assert(endDate != null),
        assert(amount != null),
        assert(users != null),
        assert(formerUsers != null),
        assert(schedule != null),
        assert(invoiceCount != null),
        assert(feePayerType != null),
        assert(monthToMonth != null),
        super(
          guid: guid,
          dateCreated: dateCreated,
          creatorGuid: creatorGuid,
          unreadCommentableObjectCount: unreadCommentableObjectCount,
          pinnedCommentableObjectCount: pinnedCommentableObjectCount,
        );

  factory Contract.fromMap(Map<String, Object> map) {
    final context = Context.fromMap(map);
    final counts = map[Key.counts] as Map;

    final users =
        (map[Key.users] as List ?? []).map((map) => ContractUser.fromMap(map));

    final formerUsers = (map[Key.formerUsers] as List ?? [])
        .map((map) => ContractUser.fromMap(map))
        .toSet();

    return Contract(
        guid: context.guid,
        dateCreated: context.dateCreated,
        creatorGuid: context.creatorGuid,
        unreadCommentableObjectCount: context.unreadCommentableObjectCount,
        pinnedCommentableObjectCount: context.pinnedCommentableObjectCount,
        invoiceCount: counts[Key.invoice] ?? 0,
        startDate: Date.fromSecondsSinceEpoch(map[Key.startTimestamp]),
        endDate: Date.fromSecondsSinceEpoch(map[Key.endTimestamp]),
        name: map[Key.name],
        amount: map[Key.amount],
        users: users.toSet(),
        formerUsers: formerUsers.toSet(),
        schedule: Schedule.fromMap(map[Key.schedule]),
        domain: NameContractDomain.fromMap(map[Key.domain]),
        feePayerType: FeePayerType.fromString(map[Key.feePayerKind]),
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
      Key.feePayerKind: feePayerType.toString(),
      Key.monthToMonth: monthToMonth
    });

    return map;
  }
}
