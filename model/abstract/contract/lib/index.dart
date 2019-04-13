import 'package:meta/meta.dart';
import 'package:date/index.dart';
import 'package:context/index.dart';
import 'package:name_context/index.dart';
import 'package:contract_user/index.dart';
import 'package:name_contract_domain/index.dart';
import 'package:fee_payer_type/index.dart';
import 'package:name_user/index.dart';
import 'package:schedule/index.dart';
import 'package:key/index.dart' as _key;

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
    final counts = map[_key.counts] as Map;

    final users =
        (map[_key.users] as List ?? []).map((map) => ContractUser.fromMap(map));

    final formerUsers = (map[_key.formerUsers] as List ?? [])
        .map((map) => ContractUser.fromMap(map))
        .toSet();

    return Contract(
        guid: context.guid,
        dateCreated: context.dateCreated,
        creatorGuid: context.creatorGuid,
        unreadCommentableObjectCount: context.unreadCommentableObjectCount,
        pinnedCommentableObjectCount: context.pinnedCommentableObjectCount,
        invoiceCount: counts[_key.invoice] ?? 0,
        startDate: Date.fromSecondsSinceEpoch(map[_key.startTimestamp]),
        endDate: Date.fromSecondsSinceEpoch(map[_key.endTimestamp]),
        name: map[_key.name],
        amount: map[_key.amount],
        users: users.toSet(),
        formerUsers: formerUsers.toSet(),
        schedule: Schedule.fromMap(map[_key.schedule]),
        domain: NameContractDomain.fromMap(map[_key.domain]),
        feePayerType: FeePayerType.fromString(map[_key.feePayerKind]),
        monthToMonth: map[_key.monthToMonth]);
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    (map[_key.counts] as Map).addAll({_key.invoice: invoiceCount});

    map.addAll({
      _key.startTimestamp: startDate.secondsSinceEpoch,
      _key.endTimestamp: endDate.secondsSinceEpoch,
      _key.name: name,
      _key.amount: amount,
      _key.users: users.map((user) => user.toMap()),
      _key.formerUsers: users.map((formerUsers) => formerUsers.toMap()),
      _key.schedule: schedule.toMap(),
      _key.domain: domain.toMap(),
      _key.feePayerKind: feePayerType.toString(),
      _key.monthToMonth: monthToMonth
    });

    return map;
  }
}
