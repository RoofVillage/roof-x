import 'package:meta/meta.dart';
import 'package:domain/index.dart';
import 'package:date/index.dart';
import 'package:balance/index.dart';
import 'package:domain_user/index.dart';
import 'package:location/index.dart';
import 'package:key/index.dart' as _key;

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
    final counts = map[_key.counts] as Map ?? {};

    final balances =
        (map[_key.balances] as List ?? []).map((map) => Balance.fromMap(map));

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
        reminderCompletionCount: counts[_key.reminderCompletion] ?? 0,
        assignedReminderCount: counts[_key.assignedReminder] ?? 0,
        dueReminderCount: counts[_key.dueReminder] ?? 0,
        outOfStockShoppingItemCount: counts[_key.outOfStockShoppingItem] ?? 0,
        shoppingItemCompletionCount: counts[_key.shoppingItemCompletion] ?? 0);
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    (map[_key.counts] as Map).addAll({
      _key.reminderCompletion: reminderCompletionCount,
      _key.assignedReminder: assignedReminderCount,
      _key.dueReminder: dueReminderCount,
      _key.outOfStockShoppingItem: outOfStockShoppingItemCount,
      _key.shoppingItemCompletion: shoppingItemCompletionCount
    });

    map.addAll({_key.balances: balances.map((balance) => balance.toMap())});

    return map;
  }
}
