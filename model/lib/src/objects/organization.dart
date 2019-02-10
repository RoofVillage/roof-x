import '../utils/index.dart';

import '../abstract/index.dart';
import '../properties/index.dart';

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
      {int unreadCommentableObjectCount,
      int pinnedCommentableObjectCount,
      String name,
      List<DomainUser> users,
      List<DomainUser> formerUsers,
      Location location,
      int expenseCount,
      int reminderCount,
      int transferCount,
      this.propertyCount,
      this.emergencyServiceRequestCount,
      this.unseenServiceRequestCount,
      this.incompleteServiceRequestCount,
      this.overdueAmount,
      this.earnedAllTimeAmount,
      this.earnedWeekAmount,
      this.earnedMonthAmount,
      this.earnedYearAmount,
      this.owedAllTimeAmount,
      this.owedWeekAmount,
      this.owedMonthAmount,
      this.owedYearAmount,
      this.billing})
      : super(
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
    final domain = Domain.fromMap(map);
    final counts = map[Key.counts] as Map;
    final earnedAmounts = map[Key.earned] as List;
    final owedAmounts = map[Key.owed] as List;

    return Organization(
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
        emergencyServiceRequestCount: counts[Key.emergencyServiceRequest],
        unseenServiceRequestCount: counts[Key.unseenServiceRequest],
        incompleteServiceRequestCount: counts[Key.incompleteServiceRequest],
        overdueAmount: owedAmounts.firstWhere((amount) => amount[Key.dayBound] == 0)[Key.amount],
        owedWeekAmount: owedAmounts.firstWhere((amount) => amount[Key.dayBound] == 7)[Key.amount],
        owedMonthAmount: owedAmounts.firstWhere((amount) => amount[Key.dayBound] == 30)[Key.amount],
        owedYearAmount: owedAmounts.firstWhere((amount) => amount[Key.dayBound] == 365)[Key.amount],
        owedAllTimeAmount:owedAmounts.firstWhere((amount) => amount[Key.dayBound] == null)[Key.amount],
        earnedWeekAmount: earnedAmounts.firstWhere((amount) => amount[Key.dayBound] == 7)[Key.amount],
        earnedMonthAmount: earnedAmounts.firstWhere((amount) => amount[Key.dayBound] == 30)[Key.amount],
        earnedYearAmount: earnedAmounts.firstWhere((amount) => amount[Key.dayBound] == 365)[Key.amount],
        earnedAllTimeAmount: earnedAmounts.firstWhere((amount) => amount[Key.dayBound] == null)[Key.amount],
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
          Key.dayBound: 7,
          Key.amount: earnedWeekAmount
        },
        {
          Key.dayBound: 30,
          Key.amount: earnedMonthAmount
        },
        {
          Key.dayBound: 365,
          Key.amount: earnedYearAmount
        },
        {
          Key.dayBound: null,
          Key.amount: earnedAllTimeAmount
        }
      ],
      Key.owed: [
        {
          Key.dayBound: 0,
          Key.amount: overdueAmount
        },
        {
          Key.dayBound: 7,
          Key.amount: owedWeekAmount
        },
        {
          Key.dayBound: 30,
          Key.amount: owedMonthAmount
        },
        {
          Key.dayBound: 365,
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
