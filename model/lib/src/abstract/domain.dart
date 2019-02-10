import '../utils/index.dart';

import '_context.dart';
import '../properties/index.dart';

class Domain extends Context {
  final String name;
  final List<DomainUser> users;
  final List<DomainUser> formerUsers;
  final Location location;
  final int expenseCount;
  final int reminderCount;
  final int transferCount;

  Domain(
      {int unreadCommentableObjectCount,
      int pinnedCommentableObjectCount,
      this.name,
      this.users,
      this.formerUsers,
      this.location,
      this.expenseCount,
      this.reminderCount,
      this.transferCount});

  factory Domain.fromMap(Map<String, Object> map) {
    final context = Context.fromMap(map);
    final counts = map[Key.counts] as Map;

    final users =
        (map[Key.users] as List).map((map) => DomainUser.fromMap(map));

    final formerUsers =
        (map[Key.formerUsers] as List).map((map) => DomainUser.fromMap(map));

    return Domain(
      unreadCommentableObjectCount: context.unreadCommentableObjectCount,
      pinnedCommentableObjectCount: context.pinnedCommentableObjectCount,
      expenseCount: counts[Key.expense],
      reminderCount: counts[Key.reminder],
      transferCount: counts[Key.transfer],
      name: map[Key.name],
      users: users,
      formerUsers: formerUsers,
      location: Location.fromMap(map[Key.location]),
    );
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    (map[Key.counts] as Map).addAll({
      Key.expense: expenseCount,
      Key.reminder: reminderCount,
      Key.transfer: transferCount
    });
    map.addAll({
      Key.name: name,
      Key.users: users.map((user) => user.toMap()),
      Key.formerUsers: formerUsers.map((formerUser) => formerUser.toMap()),
      Key.location: location.toMap()
    });

    return map;
  }
}
