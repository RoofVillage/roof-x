import 'package:date/index.dart';
import 'package:meta/meta.dart';

import '../utils/index.dart';

import 'context.dart';
import '../properties/index.dart';

class Domain extends Context {
  final String name;
  final Set<DomainUser> users;
  final Set<DomainUser> formerUsers;
  final Location location;
  final int expenseCount;
  final int reminderCount;
  final int transferCount;

  @override
  Set<String> get userGuids => users.map((user) => user.guid);

  @override
  Set<String> get formerUserGuids => formerUsers.map((user) => user.guid);

  @override
  Set<NameUser> get nameUsers {
    return users.followedBy(formerUsers).toSet();
  }

  Domain(
      {@required String guid,
      @required Date dateCreated,
      @required String creatorGuid,
      @required int unreadCommentableObjectCount,
      @required int pinnedCommentableObjectCount,
      @required this.name,
      @required this.users,
      @required this.formerUsers,
      @required this.location,
      @required this.expenseCount,
      @required this.reminderCount,
      @required this.transferCount})
      :
        //Domains will always be user made.
        assert(creatorGuid != null),
        assert(name != null),
        assert(users != null),
        assert(formerUsers != null),
        assert(location != null),
        assert(expenseCount != null),
        assert(reminderCount != null),
        assert(transferCount != null),
        super(
          guid: guid,
          dateCreated: dateCreated,
          creatorGuid: creatorGuid,
          unreadCommentableObjectCount: unreadCommentableObjectCount,
          pinnedCommentableObjectCount: pinnedCommentableObjectCount,
        );

  factory Domain.fromMap(Map<String, Object> map) {
    final context = Context.fromMap(map);
    final counts = map[Key.counts] as Map;

    final users =
        (map[Key.users] as List ?? []).map((map) => DomainUser.fromMap(map));

    final formerUsers = (map[Key.formerUsers] as List ?? [])
        .map((map) => DomainUser.fromMap(map));

    return Domain(
      guid: context.guid,
      dateCreated: context.dateCreated,
      creatorGuid: context.creatorGuid,
      unreadCommentableObjectCount: context.unreadCommentableObjectCount,
      pinnedCommentableObjectCount: context.pinnedCommentableObjectCount,
      expenseCount: counts[Key.expense] ?? 0,
      reminderCount: counts[Key.reminder] ?? 0,
      transferCount: counts[Key.transfer] ?? 0,
      name: map[Key.name],
      users: users.toSet(),
      formerUsers: formerUsers.toSet(),
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
