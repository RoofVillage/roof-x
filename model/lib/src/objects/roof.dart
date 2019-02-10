import '../utils/index.dart';

import '../abstract/index.dart';
import '../properties/index.dart';

class Roof extends Domain {
  final List<Balance> balances;
  final int reminderCompletionCount;
  final int assignedReminderCount;
  final int dueReminderCount;
  final int outOfStockShoppingItemCount;
  final int shoppingItemCompletionCount;

  Roof(
      {int unreadCommentableObjectCount,
      int pinnedCommentableObjectCount,
      String name,
      List<DomainUser> users,
      List<DomainUser> formerUsers,
      Location location,
      int expenseCount,
      int reminderCount,
      int transferCount,
      this.balances,
      this.reminderCompletionCount,
      this.assignedReminderCount,
      this.dueReminderCount,
      this.outOfStockShoppingItemCount,
      this.shoppingItemCompletionCount})
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

  factory Roof.fromMap(Map<String, Object> map) {
    final domain = Domain.fromMap(map);
    final counts = map[Key.counts] as Map;

    final balances =
        (map[Key.balances] as List).map((map) => Balance.fromMap(map));

    return Roof(
        unreadCommentableObjectCount: domain.unreadCommentableObjectCount,
        pinnedCommentableObjectCount: domain.pinnedCommentableObjectCount,
        expenseCount: domain.expenseCount,
        reminderCount: domain.reminderCount,
        transferCount: domain.transferCount,
        name: domain.name,
        users: domain.users,
        formerUsers: domain.formerUsers,
        location: domain.location,
        balances: balances,
        reminderCompletionCount: counts[Key.reminderCompletion],
        assignedReminderCount: counts[Key.assignedReminder],
        dueReminderCount: counts[Key.dueReminder],
        outOfStockShoppingItemCount: counts[Key.outOfStockShoppingItem],
        shoppingItemCompletionCount: counts[Key.shoppingItemCompletion]);
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    (map[Key.counts] as Map).addAll({
      Key.reminderCompletion: reminderCompletionCount,
      Key.assignedReminder: assignedReminderCount,
      Key.dueReminder: dueReminderCount,
      Key.outOfStockShoppingItem: outOfStockShoppingItemCount,
      Key.shoppingItemCompletion: shoppingItemCompletionCount
    });

    map.addAll({Key.balances: balances.map((balance) => balance.toMap())});

    return map;
  }
}
