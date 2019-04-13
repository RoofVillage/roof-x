import 'package:meta/meta.dart';
import 'package:types/index.dart';
import 'package:date/index.dart';

import 'feed_object.dart';
import '../utils/index.dart';
import '../properties/index.dart';
import '../objects/index.dart';
import '../abstract/index.dart';
import '../mixins/index.dart';
import '../key.dart' as _key;

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
    final counts = map[_key.counts] as Map;
    return CommentableObject(
        contractDomainUsers: feedObject.contractDomainUsers.toSet(),
        contractUsers: feedObject.contractUsers.toSet(),
        formerContractUsers: feedObject.formerContractUsers.toSet(),
        contractStubs: feedObject.contractStubs.toSet(),
        formerContractStubs: feedObject.formerContractStubs.toSet(),
        contractPropertyName: feedObject.contractPropertyName,
        feePayerType: feedObject.feePayerType,
        clientReferenceId: feedObject.clientReferenceId,
        commentCount: counts[_key.comment],
        name: map[_key.name],
        note: map[_key.note],
        latestActivity: map[_key.latestActivity],
        unread: map[_key.unread],
        pinned: map[_key.pinned],
        subscribers: map[_key.subscribers]);
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      _key.counts: {_key.comment: commentCount},
      _key.name: name,
      _key.note: note,
      _key.latestActivity: latestActivity.secondsSinceEpoch,
      _key.unread: unread,
      _key.pinned: pinned,
      _key.subscribers: subscribers.map((subscriber) => subscriber.toMap())
    });
    return map;
  }

  String formattedSubscribers(
      {String sessionOwnerGuid,
      @required NameDefiningObject nameDefiningObject,
      bool firstPerson = false}) {
    return formatNames(
        guids: subscribers.map((user) => user.guid),
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        firstPerson: firstPerson);
  }
}
