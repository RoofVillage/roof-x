import 'package:meta/meta.dart';
import 'package:types/index.dart';
import 'package:date/index.dart';
import '../utils/index.dart';
import '../properties/index.dart';
import '../objects/index.dart';
import '../abstract/index.dart';
import '../mixins/index.dart';

import 'feed_object.dart';

class CommentableObject extends FeedObject {
  final int commentCount;
  final String name;
  final String note;
  final Date latestActivity;
  final bool unread;
  final bool pinned;
  final Set<UserReference> subscribers;

  CommentableObject(
      {Set<NameUser> contractDomainUsers,
      Set<NameUser> contractUsers,
      Set<NameUser> formerContractUsers,
      Set<Stub> contractStubs,
      Set<Stub> formerContractStubs,
      String contractPropertyName,
      FeePayerType feePayerType,
      String clientReferenceId,
      this.commentCount,
      this.name,
      this.note,
      this.latestActivity,
      this.unread,
      this.pinned,
      this.subscribers})
      : super(
            contractDomainUsers: contractDomainUsers,
            contractUsers: contractUsers,
            formerContractUsers: formerContractUsers,
            contractStubs: contractStubs,
            formerContractStubs: formerContractStubs,
            contractPropertyName: contractPropertyName,
            feePayerType: feePayerType,
            clientReferenceId: clientReferenceId);

  factory CommentableObject.fromMap(Map<String, Object> map) {
    final feedObject = FeedObject.fromMap(map);
    final counts = map[Key.counts] as Map;
    return CommentableObject(
        contractDomainUsers: feedObject.contractDomainUsers.toSet(),
        contractUsers: feedObject.contractUsers.toSet(),
        formerContractUsers: feedObject.formerContractUsers.toSet(),
        contractStubs: feedObject.contractStubs.toSet(),
        formerContractStubs: feedObject.formerContractStubs.toSet(),
        contractPropertyName: feedObject.contractPropertyName,
        feePayerType: feedObject.feePayerType,
        clientReferenceId: feedObject.clientReferenceId,
        commentCount: counts[Key.comment],
        name: map[Key.name],
        note: map[Key.note],
        latestActivity: map[Key.latestActivity],
        unread: map[Key.unread],
        pinned: map[Key.pinned],
        subscribers: map[Key.subscribers]);
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      Key.counts: {Key.comment: commentCount},
      Key.name: name,
      Key.note: note,
      Key.latestActivity: latestActivity.secondsSinceEpoch,
      Key.unread: unread,
      Key.pinned: pinned,
      Key.subscribers: subscribers.map((subscriber) => subscriber.toMap())
    });
    return map;
  }

  String formattedSubscribers(
      {String sessionOwnerGuid,
      @required NameDefiningObject nameDefiningObject,
      bool firstPerson = false}) {
    return formatName(
        guids: subscribers.map((user) => user.guid),
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        firstPerson: firstPerson);
  }
}
