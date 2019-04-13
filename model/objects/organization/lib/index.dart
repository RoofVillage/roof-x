import 'package:meta/meta.dart';
import 'package:domain/index.dart';
import 'package:date/index.dart';
import 'package:billing/index.dart';
import 'package:domain_user/index.dart';
import 'package:location/index.dart';
import 'package:key/index.dart' as _key;

const _MAP_NO_DAYS = 0;
const _MAP_DAYS_IN_WEEK = 7;
const _MAP_DAYS_IN_MONTH = 30;
const _MAP_DAYS_IN_YEAR = 365;

class Organization extends Domain {
  final int propertyCount;
  final int emergencyServiceRequestCount;
  final int unseenServiceRequestCount;
  final int incompleteServiceRequestCount;
  final int overdueAmount;
  final int earnedAllTimeAmount;
  final int earnedWeekAmount;
  final int earnedMonthAmount;
  final int earnedYearAmount;
  final int owedAllTimeAmount;
  final int owedWeekAmount;
  final int owedMonthAmount;
  final int owedYearAmount;
  final Billing billing;

  Organization(
      {@required String guid,
      @required Date dateCreated,
      @required String creatorGuid,
      @required int unreadCommentableObjectCount,
      @required int pinnedCommentableObjectCount,
      @required String name,
      @required Set<DomainUser> users,
      @required Set<DomainUser> formerUsers,
      @required Location location,
      @required int expenseCount,
      @required int reminderCount,
      @required int transferCount,
      @required this.propertyCount,
      @required this.emergencyServiceRequestCount,
      @required this.unseenServiceRequestCount,
      @required this.incompleteServiceRequestCount,
      @required this.overdueAmount,
      @required this.earnedAllTimeAmount,
      @required this.earnedWeekAmount,
      @required this.earnedMonthAmount,
      @required this.earnedYearAmount,
      @required this.owedAllTimeAmount,
      @required this.owedWeekAmount,
      @required this.owedMonthAmount,
      @required this.owedYearAmount,
      @required this.billing})
      : assert(propertyCount != null), 
      assert(emergencyServiceRequestCount != null), 
      assert(unseenServiceRequestCount != null),
      assert(incompleteServiceRequestCount != null),
      assert(overdueAmount != null),
      assert(earnedAllTimeAmount != null),
      assert(earnedWeekAmount != null),
      assert(earnedMonthAmount != null),
      assert(earnedYearAmount != null),
      assert(owedAllTimeAmount != null),
      assert(owedWeekAmount != null),
      assert(owedMonthAmount != null),
      assert(owedYearAmount != null),
      assert(billing != null), super(
        guid: guid,
        dateCreated: dateCreated,
        creatorGuid: creatorGuid,
            unreadCommentableObjectCount: unreadCommentableObjectCount,
            pinnedCommentableObjectCount: pinnedCommentableObjectCount,
            name: name,
            users: users,
            formerUsers: formerUsers,
            location: location,
            expenseCount: expenseCount,
            reminderCount: reminderCount,
            transferCount: transferCount);

  factory Organization.fromMap(Map<String, Object> map) {
    assert(map != null);

    final domain = Domain.fromMap(map);
    final counts = map[_key.counts] as Map ?? {};
    final earnedAmounts = map[_key.earned] as List ?? [];
    final owedAmounts = map[_key.owed] as List ?? [];

    return Organization(
      guid: domain.guid,
      dateCreated: domain.dateCreated,
      creatorGuid: domain.creatorGuid,
        unreadCommentableObjectCount: domain.unreadCommentableObjectCount,
        pinnedCommentableObjectCount: domain.pinnedCommentableObjectCount,
        expenseCount: domain.expenseCount,
        reminderCount: domain.reminderCount,
        transferCount: domain.transferCount,
        name: domain.name,
        users: domain.users,
        formerUsers: domain.formerUsers,
        location: domain.location,
        propertyCount: counts[_key.property],
        emergencyServiceRequestCount: counts[_key.emergencyServiceRequest] ?? 0,
        unseenServiceRequestCount: counts[_key.unseenServiceRequest] ?? 0,
        incompleteServiceRequestCount: counts[_key.incompleteServiceRequest] ?? 0,
        overdueAmount: (owedAmounts.firstWhere((amount) => amount[_key.dayBound] == _MAP_NO_DAYS) ?? {})[_key.amount] ?? 0,
        owedWeekAmount: (owedAmounts.firstWhere((amount) => amount[_key.dayBound] == _MAP_DAYS_IN_WEEK) ?? {})[_key.amount] ?? 0,
        owedMonthAmount: (owedAmounts.firstWhere((amount) => amount[_key.dayBound] == _MAP_DAYS_IN_MONTH) ?? {})[_key.amount] ?? 0,
        owedYearAmount: (owedAmounts.firstWhere((amount) => amount[_key.dayBound] == _MAP_DAYS_IN_YEAR) ?? {})[_key.amount] ?? 0,
        owedAllTimeAmount:(owedAmounts.firstWhere((amount) => amount[_key.dayBound] == null) ?? {})[_key.amount] ?? 0,
        earnedWeekAmount: (earnedAmounts.firstWhere((amount) => amount[_key.dayBound] == _MAP_DAYS_IN_WEEK) ?? {})[_key.amount] ?? 0,
        earnedMonthAmount: (earnedAmounts.firstWhere((amount) => amount[_key.dayBound] == _MAP_DAYS_IN_MONTH) ?? {})[_key.amount] ?? 0,
        earnedYearAmount: (earnedAmounts.firstWhere((amount) => amount[_key.dayBound] == _MAP_DAYS_IN_YEAR) ?? {})[_key.amount] ?? 0,
        earnedAllTimeAmount: (earnedAmounts.firstWhere((amount) => amount[_key.dayBound] == null) ?? {})[_key.amount] ?? 0,
        billing: Billing.fromMap(map[_key.billing]));
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    (map[_key.counts] as Map).addAll({
      _key.property: propertyCount,
      _key.emergencyServiceRequest: emergencyServiceRequestCount,
      _key.unseenServiceRequest: unseenServiceRequestCount,
      _key.incompleteServiceRequest: incompleteServiceRequestCount
    });

    map.addAll({_key.amounts: {
      _key.earned: [
        {
          _key.dayBound: _MAP_DAYS_IN_WEEK,
          _key.amount: earnedWeekAmount
        },
        {
          _key.dayBound: _MAP_DAYS_IN_MONTH,
          _key.amount: earnedMonthAmount
        },
        {
          _key.dayBound: _MAP_DAYS_IN_YEAR,
          _key.amount: earnedYearAmount
        },
        {
          _key.dayBound: null,
          _key.amount: earnedAllTimeAmount
        }
      ],
      _key.owed: [
        {
          _key.dayBound: _MAP_NO_DAYS,
          _key.amount: overdueAmount
        },
        {
          _key.dayBound: _MAP_DAYS_IN_WEEK,
          _key.amount: owedWeekAmount
        },
        {
          _key.dayBound: _MAP_DAYS_IN_MONTH,
          _key.amount: owedMonthAmount
        },
        {
          _key.dayBound: _MAP_DAYS_IN_YEAR,
          _key.amount: owedYearAmount
        },
        {
          _key.dayBound: null,
          _key.amount: owedAllTimeAmount
        }
      ]},
      _key.billing: billing.toMap()
    });

    return map;
  }
}
