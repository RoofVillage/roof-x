import 'package:date/index.dart';
import 'package:meta/meta.dart';

import '../utils/index.dart';

import '../abstract/index.dart';
import '../properties/index.dart';

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
    final counts = map[Key.counts] as Map ?? {};
    final earnedAmounts = map[Key.earned] as List ?? [];
    final owedAmounts = map[Key.owed] as List ?? [];

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
        propertyCount: counts[Key.property],
        emergencyServiceRequestCount: counts[Key.emergencyServiceRequest] ?? 0,
        unseenServiceRequestCount: counts[Key.unseenServiceRequest] ?? 0,
        incompleteServiceRequestCount: counts[Key.incompleteServiceRequest] ?? 0,
        overdueAmount: (owedAmounts.firstWhere((amount) => amount[Key.dayBound] == _MAP_NO_DAYS) ?? {})[Key.amount] ?? 0,
        owedWeekAmount: (owedAmounts.firstWhere((amount) => amount[Key.dayBound] == _MAP_DAYS_IN_WEEK) ?? {})[Key.amount] ?? 0,
        owedMonthAmount: (owedAmounts.firstWhere((amount) => amount[Key.dayBound] == _MAP_DAYS_IN_MONTH) ?? {})[Key.amount] ?? 0,
        owedYearAmount: (owedAmounts.firstWhere((amount) => amount[Key.dayBound] == _MAP_DAYS_IN_YEAR) ?? {})[Key.amount] ?? 0,
        owedAllTimeAmount:(owedAmounts.firstWhere((amount) => amount[Key.dayBound] == null) ?? {})[Key.amount] ?? 0,
        earnedWeekAmount: (earnedAmounts.firstWhere((amount) => amount[Key.dayBound] == _MAP_DAYS_IN_WEEK) ?? {})[Key.amount] ?? 0,
        earnedMonthAmount: (earnedAmounts.firstWhere((amount) => amount[Key.dayBound] == _MAP_DAYS_IN_MONTH) ?? {})[Key.amount] ?? 0,
        earnedYearAmount: (earnedAmounts.firstWhere((amount) => amount[Key.dayBound] == _MAP_DAYS_IN_YEAR) ?? {})[Key.amount] ?? 0,
        earnedAllTimeAmount: (earnedAmounts.firstWhere((amount) => amount[Key.dayBound] == null) ?? {})[Key.amount] ?? 0,
        billing: Billing.fromMap(map[Key.billing]));
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    (map[Key.counts] as Map).addAll({
      Key.property: propertyCount,
      Key.emergencyServiceRequest: emergencyServiceRequestCount,
      Key.unseenServiceRequest: unseenServiceRequestCount,
      Key.incompleteServiceRequest: incompleteServiceRequestCount
    });

    map.addAll({Key.amounts: {
      Key.earned: [
        {
          Key.dayBound: _MAP_DAYS_IN_WEEK,
          Key.amount: earnedWeekAmount
        },
        {
          Key.dayBound: _MAP_DAYS_IN_MONTH,
          Key.amount: earnedMonthAmount
        },
        {
          Key.dayBound: _MAP_DAYS_IN_YEAR,
          Key.amount: earnedYearAmount
        },
        {
          Key.dayBound: null,
          Key.amount: earnedAllTimeAmount
        }
      ],
      Key.owed: [
        {
          Key.dayBound: _MAP_NO_DAYS,
          Key.amount: overdueAmount
        },
        {
          Key.dayBound: _MAP_DAYS_IN_WEEK,
          Key.amount: owedWeekAmount
        },
        {
          Key.dayBound: _MAP_DAYS_IN_MONTH,
          Key.amount: owedMonthAmount
        },
        {
          Key.dayBound: _MAP_DAYS_IN_YEAR,
          Key.amount: owedYearAmount
        },
        {
          Key.dayBound: null,
          Key.amount: owedAllTimeAmount
        }
      ]},
      Key.billing: billing.toMap()
    });

    return map;
  }
}
