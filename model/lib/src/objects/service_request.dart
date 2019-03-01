import 'package:types/index.dart';
import 'package:date/index.dart';
import '../utils/index.dart';
import '../properties/index.dart';
import '../objects/index.dart';
import '../abstract/index.dart';

class ServiceRequest extends Task {
  final bool permissionToEnter;
  final String permissionToEnterNote;
  final bool isEmergency;
  final bool seen;

  ServiceRequest(
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
      this.permissionToEnter,
      this.permissionToEnterNote,
      this.isEmergency,
      this.seen})
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

  factory ServiceRequest.fromMap(Map<String, Object> map) {
    assert(map != null);

    final task = Task.fromMap(map);

    return ServiceRequest(
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
        permissionToEnter: map[Key.permissionToEnter],
        permissionToEnterNote: map[Key.permissionToEnterNote],
        isEmergency: map[Key.isEmergency],
        seen: map[Key.seen]);
  }

  Map<String, Object> toMap() {
    final map = super.toMap();

    map.addAll({
      Key.permissionToEnter: permissionToEnter,
      Key.permissionToEnterNote: permissionToEnterNote,
      Key.isEmergency: isEmergency,
      Key.seen: seen
    });
    return map;
  }
}
