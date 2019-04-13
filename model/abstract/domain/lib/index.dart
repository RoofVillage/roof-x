import 'package:meta/meta.dart';

import 'package:date/index.dart';
import 'package:context/index.dart';
import 'package:domain_user/index.dart';
import 'package:location/index.dart';
import 'package:name_user/index.dart';
import 'package:key/index.dart' as _key;

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
    final counts = map[_key.counts] as Map;

    final users =
        (map[_key.users] as List ?? []).map((map) => DomainUser.fromMap(map));

    final formerUsers = (map[_key.formerUsers] as List ?? [])
        .map((map) => DomainUser.fromMap(map));

    return Domain(
      guid: context.guid,
      dateCreated: context.dateCreated,
      creatorGuid: context.creatorGuid,
      unreadCommentableObjectCount: context.unreadCommentableObjectCount,
      pinnedCommentableObjectCount: context.pinnedCommentableObjectCount,
      expenseCount: counts[_key.expense] ?? 0,
      reminderCount: counts[_key.reminder] ?? 0,
      transferCount: counts[_key.transfer] ?? 0,
      name: map[_key.name],
      users: users.toSet(),
      formerUsers: formerUsers.toSet(),
      location: Location.fromMap(map[_key.location]),
    );
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    (map[_key.counts] as Map).addAll({
      _key.expense: expenseCount,
      _key.reminder: reminderCount,
      _key.transfer: transferCount
    });
    map.addAll({
      _key.name: name,
      _key.users: users.map((user) => user.toMap()),
      _key.formerUsers: formerUsers.map((formerUser) => formerUser.toMap()),
      _key.location: location.toMap()
    });

    return map;
  }
}
