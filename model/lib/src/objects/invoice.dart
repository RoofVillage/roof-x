import 'package:types/index.dart';
import 'package:date/index.dart';
import '../utils/index.dart';
import '../properties/index.dart';
import '../objects/index.dart';
import '../abstract/index.dart';

class Invoice extends Task {
  final InvoiceType type;
  final int amount;
  final int paid;
  final Set<Payer> payers;
  final bool overridePaymentBuffer;

  Invoice(
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
      Set<UserReference> participants,
      Set<UserReference> completingUsers,
      Set<UserReference> assignedUsers,
      Date latestActivation,
      Date latestCompletion,
      Set<CompletionCount> completionCounts,
      Schedule schedule,
      Date deadline,
      AssignmentType assignmentType,
      DateParts deadlineParts,
      bool currentlyCompleted,
      int completionCount,
      int completionPrize,
      this.type,
      this.amount,
      this.paid,
      this.payers,
      this.overridePaymentBuffer})
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
            subscribers: subscribers,
            participants: participants,
            completingUsers: completingUsers,
            assignedUsers: assignedUsers,
            latestActivation: latestActivation,
            latestCompletion: latestCompletion,
            completionCounts: completionCounts,
            schedule: schedule,
            deadline: deadline,
            assignmentType: assignmentType,
            deadlineParts: deadlineParts,
            currentlyCompleted: currentlyCompleted,
            completionCount: completionCount,
            completionPrize: completionPrize);

  factory Invoice.fromMap(Map<String, Object> map) {
    assert(map != null);

    final task = Task.fromMap(map);

    final payers = (map[Key.payers] as List).map((map) => Payer.fromMap(map));

    return Invoice(
        contractDomainUsers: task.contractDomainUsers,
        contractUsers: task.contractUsers,
        formerContractUsers: task.formerContractUsers,
        contractStubs: task.contractStubs,
        formerContractStubs: task.formerContractStubs,
        contractPropertyName: task.contractPropertyName,
        feePayerType: task.feePayerType,
        clientReferenceId: task.clientReferenceId,
        commentCount: task.commentCount,
        name: task.name,
        note: task.note,
        latestActivity: task.latestActivity,
        unread: task.unread,
        pinned: task.pinned,
        subscribers: task.subscribers,
        participants: task.participants,
        completingUsers: task.completingUsers,
        assignedUsers: task.assignedUsers,
        latestActivation: task.latestActivation,
        latestCompletion: task.latestCompletion,
        completionCounts: task.completionCounts,
        schedule: task.schedule,
        deadline: task.deadline,
        assignmentType: task.assignmentType,
        deadlineParts: task.deadlineParts,
        currentlyCompleted: task.currentlyCompleted,
        completionCount: task.completionCount,
        completionPrize: task.completionPrize,
        type: InvoiceType.fromString(map[Key.kind]),
        amount: map[Key.amount],
        paid: map[Key.paid],
        payers: payers.toSet(),
        overridePaymentBuffer: map[Key.overridePaymentBuffer]);
  }

  Map<String, Object> toMap() {
    final map = super.toMap();

    map.addAll({
      Key.kind: type.toString(),
      Key.amount: amount,
      Key.paid: paid,
      Key.payers: payers.map((payer) => payer.toMap()),
      Key.overridePaymentBuffer: overridePaymentBuffer
    });
    return map;
  }

  Payer payerForGuid(String guid) {
    return payers.firstWhere((payer) => payer.bankOwner.guid == guid);
  }

  @override
  String title({Context context, String sessionOwnerGuid}) {
    String text = name;
    if (deadline != null) {
      text += " due " + deadline.toLongString;
    }
    final propertyTitle = this
        .propertyTitle(context: context, sessionOwnerGuid: sessionOwnerGuid);
    if (propertyTitle != null) text += propertyTitle;

    return text;
  }
}
