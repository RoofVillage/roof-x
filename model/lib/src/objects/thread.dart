import 'package:types/index.dart';
import 'package:date/index.dart';
import '../utils/index.dart';
import '../properties/index.dart';
import '../objects/index.dart';
import '../abstract/index.dart';

class Thread extends CommentableObject {
  final ThreadType type;

  Thread(
      {Set<NameUser> contractDomainUsers,
      Set<NameUser> contractUsers,
      Set<NameUser> formerContractUsers,
      Set<Stub> contractStubs,
      Set<Stub> formerContractStubs,
      String contractPropertyName,
      FeePayerType feePayerType,
      String clientReferenceId,
      int commentCount,
      String name,
      String note,
      Date latestActivity,
      bool unread,
      bool pinned,
      Set<UserReference> subscribers,
      this.type})
      : super(
            contractDomainUsers: contractDomainUsers,
            contractUsers: contractUsers,
            formerContractUsers: formerContractUsers,
            contractStubs: contractStubs,
            formerContractStubs: formerContractStubs,
            contractPropertyName: contractPropertyName,
            feePayerType: feePayerType,
            clientReferenceId: clientReferenceId,
            commentCount: commentCount,
            name: name,
            note: note,
            latestActivity: latestActivity,
            unread: unread,
            pinned: pinned,
            subscribers: subscribers);

  factory Thread.fromMap(Map<String, Object> map) {
    assert(map != null);

    final commentableObject = CommentableObject.fromMap(map);
    return Thread(
        contractDomainUsers: commentableObject.contractDomainUsers,
        contractUsers: commentableObject.contractUsers,
        formerContractUsers: commentableObject.formerContractUsers,
        contractStubs: commentableObject.contractStubs,
        formerContractStubs: commentableObject.formerContractStubs,
        contractPropertyName: commentableObject.contractPropertyName,
        feePayerType: commentableObject.feePayerType,
        clientReferenceId: commentableObject.clientReferenceId,
        commentCount: commentableObject.commentCount,
        name: commentableObject.name,
        note: commentableObject.note,
        latestActivity: commentableObject.latestActivity,
        unread: commentableObject.unread,
        pinned: commentableObject.pinned,
        subscribers: commentableObject.subscribers,
        type: ThreadType.fromString(map[Key.kind]));
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({Key.kind: type.toString()});
    return map;
  }
}
