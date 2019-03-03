import 'package:date/index.dart';
import 'package:meta/meta.dart';

import '../utils/index.dart';

import '../abstract/index.dart';
import '../properties/index.dart';

class Roof extends Domain {
  final Set<Balance> balances;
  final int reminderCompletionCount;
  final int assignedReminderCount;
  final int dueReminderCount;
  final int outOfStockShoppingItemCount;
  final int shoppingItemCompletionCount;

  Roof(
      {@required String guid,
      @required Date dateCreated,
      @required creatorGuid,
      @required int unreadCommentableObjectCount,
      @required int pinnedCommentableObjectCount,
      @required String name,
      @required Set<DomainUser> users,
      @required Set<DomainUser> formerUsers,
      @required Location location,
      @required int expenseCount,
      @required int reminderCount,
      @required int transferCount,
      @required this.balances,
      @required this.reminderCompletionCount,
      @required this.assignedReminderCount,
      @required this.dueReminderCount,
      @required this.outOfStockShoppingItemCount,
      @required this.shoppingItemCompletionCount})
      : super(
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

  factory Roof.fromMap(Map<String, Object> map) {
    assert(map != null);

    final domain = Domain.fromMap(map);
    final counts = map[Key.counts] as Map ?? {};

    final balances =
        (map[Key.balances] as List ?? []).map((map) => Balance.fromMap(map));

    return Roof(
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
        balances: balances.toSet(),
        reminderCompletionCount: counts[Key.reminderCompletion] ?? 0,
        assignedReminderCount: counts[Key.assignedReminder] ?? 0,
        dueReminderCount: counts[Key.dueReminder] ?? 0,
        outOfStockShoppingItemCount: counts[Key.outOfStockShoppingItem] ?? 0,
        shoppingItemCompletionCount: counts[Key.shoppingItemCompletion] ?? 0);
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
