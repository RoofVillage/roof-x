import 'package:meta/meta.dart';
import 'package:types/index.dart';
import '../utils/index.dart';
import '../properties/index.dart';
import '../abstract/index.dart';
import '../mixins/index.dart';

import 'stub.dart';

class Comment extends FeedObject {
  final String name;
  final String body;
  final bool edited;
  final bool unread;
  final UserReference user;
  final CommentableObjectReference commentableObject;

  Comment(
      {Set<NameUser> contractDomainUsers,
      Set<NameUser> contractUsers,
      Set<NameUser> formerContractUsers,
      Set<Stub> contractStubs,
      Set<Stub> formerContractStubs,
      String contractPropertyName,
      FeePayerType feePayerType,
      String clientReferenceId,
      this.name,
      this.body,
      this.edited,
      this.unread,
      this.user,
      this.commentableObject})
      : super(
            contractDomainUsers: contractDomainUsers,
            contractUsers: contractUsers,
            formerContractUsers: formerContractUsers,
            contractStubs: contractStubs,
            formerContractStubs: formerContractStubs,
            contractPropertyName: contractPropertyName,
            feePayerType: feePayerType,
            clientReferenceId: clientReferenceId);

  factory Comment.fromMap(Map<String, Object> map) {
    assert(map != null);

    final feedObject = FeedObject.fromMap(map);
    return Comment(
        contractDomainUsers: feedObject.contractDomainUsers,
        contractUsers: feedObject.contractUsers,
        formerContractUsers: feedObject.formerContractUsers,
        contractStubs: feedObject.contractStubs,
        formerContractStubs: feedObject.formerContractStubs,
        contractPropertyName: feedObject.contractPropertyName,
        feePayerType: feedObject.feePayerType,
        clientReferenceId: feedObject.clientReferenceId,
        name: map[Key.name],
        body: map[Key.body],
        edited: map[Key.edited],
        unread: map[Key.unread],
        user: UserReference.fromMap(map[Key.user]),
        commentableObject: CommentableObjectReference.fromMap(map[Key.object]));
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      Key.name: name,
      Key.body: body,
      Key.edited: edited,
      Key.unread: unread,
      Key.user: user.toMap(),
      Key.object: commentableObject.toMap()
    });
    return map;
  }

  String formattedUser(
      {String sessionOwnerGuid,
      @required NameDefiningObject nameDefiningObject,
      bool firstPerson = false}) {
    return formatName(
        guids: [user.guid],
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        firstPerson: firstPerson);
  }
}
