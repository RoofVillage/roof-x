import 'package:meta/meta.dart';
import 'package:types/index.dart';
import 'package:date/index.dart';
import '../utils/index.dart';
import '../properties/index.dart';
import '../objects/index.dart';
import '../mixins/index.dart';

import 'commentable_object.dart';
import 'context.dart';

class Task extends CommentableObject {
  final Set<UserReference> participants;
  final Set<UserReference> completingUsers;
  final Set<UserReference> assignedUsers;
  final Date latestActivation;
  final Date latestCompletion;
  final Set<CompletionCount> completionCounts;
  final Schedule schedule;
  final Date deadline;
  final AssignmentType assignmentType;
  final DateParts deadlineParts;
  final bool currentlyCompleted;
  final int completionCount;
  final int completionPrize;

  Task(
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
      this.participants,
      this.completingUsers,
      this.assignedUsers,
      this.latestActivation,
      this.latestCompletion,
      this.completionCounts,
      this.schedule,
      this.deadline,
      this.assignmentType,
      this.deadlineParts,
      this.currentlyCompleted,
      this.completionCount,
      this.completionPrize})
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

  factory Task.fromMap(Map<String, Object> map) {
    final commentableObject = CommentableObject.fromMap(map);

    final participants = (map[Key.participants] as List)
        .map((map) => UserReference.fromMap(map));
    final completingUsers = (map[Key.completingUsers] as List)
        .map((map) => UserReference.fromMap(map));
    final assignedUsers = (map[Key.assignedUsers] as List)
        .map((map) => UserReference.fromMap(map));
    final completionCounts = (map[Key.completionCounts] as List)
        .map((map) => CompletionCount.fromMap(map));

    final counts = map[Key.counts] as Map;

    return Task(
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
        participants: participants.toSet(),
        completingUsers: completingUsers.toSet(),
        assignedUsers: assignedUsers.toSet(),
        latestActivation: Date.fromSecondsSinceEpoch(map[Key.latestActivation]),
        latestCompletion: Date.fromSecondsSinceEpoch(map[Key.latestCompletion]),
        completionCounts: completionCounts.toSet(),
        schedule: Schedule.fromMap(map[Key.schedule]),
        deadline: Date.fromSecondsSinceEpoch(map[Key.deadline]),
        assignmentType: AssignmentType.fromString(map[Key.assigmentKind]),
        deadlineParts: DateParts.fromMap(map[Key.deadlineParts]),
        currentlyCompleted: map[Key.currentlyCompleted],
        completionCount: counts[Key.completion],
        completionPrize: map[Key.completionPrize]);
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    (map[Key.counts] as Map).addAll({Key.completion: completionCount});

    map.addAll({
      Key.participants: participants.map((participant) => participant.toMap()),
      Key.completingUsers:
          completingUsers.map((completingUser) => completingUser.toMap()),
      Key.assignedUsers:
          assignedUsers.map((assignedUser) => assignedUser.toMap()),
      Key.latestActivation: latestActivation.secondsSinceEpoch,
      Key.latestCompletion: latestCompletion.secondsSinceEpoch,
      Key.completionCounts:
          completionCounts.map((completionCount) => completionCount.toMap()),
      Key.schedule: schedule.toMap(),
      Key.deadline: deadline.secondsSinceEpoch,
      Key.assigmentKind: assignmentType.toString(),
      Key.deadlineParts: deadlineParts.toMap(),
      Key.currentlyCompleted: currentlyCompleted,
      Key.completionPrize: completionPrize
    });
    return map;
  }

  CompletionCount completionCountForGuid(String guid) {
    return completionCounts
        .where((completionCount) => completionCount.user.guid == guid)
        .first;
  }

  bool assignedToUser(String guid) {
    return assignedUsers.any((assignedUser) => assignedUser.guid == guid);
  }

  String formattedAssignedUser(
      {String sessionOwnerGuid,
      @required NameDefiningObject nameDefiningObject,
      bool firstPerson = false}) {
    return formatName(
        guids: assignedUsers.map((user) => user.guid),
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        firstPerson: firstPerson);
  }

  String formattedParticipants(
      {String sessionOwnerGuid,
      @required NameDefiningObject nameDefiningObject,
      bool firstPerson = false}) {
    return formatName(
        guids: participants.map((user) => user.guid),
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        firstPerson: firstPerson);
  }

  String formattedCompletingUsers(
      {String sessionOwnerGuid,
      @required NameDefiningObject nameDefiningObject,
      bool firstPerson = false}) {
    return formatName(
        guids: completingUsers.map((user) => user.guid),
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        firstPerson: firstPerson);
  }

  String title({Context context, String sessionOwnerGuid}) {
    String text = name;
    final propertyTitle = this
        .propertyTitle(context: context, sessionOwnerGuid: sessionOwnerGuid);
    if (propertyTitle != null) text += propertyTitle;

    return text;
  }

  String propertyTitle({Context context, String sessionOwnerGuid}) {
    if (contractPropertyName == null ||
        !context.userGuids.contains(sessionOwnerGuid)) return null;
    return " at " + contractPropertyName;
  }
}

// enum TaskStateType {
//     case scheduledIncomplete
//     case scheduledComplete
//     case scheduledOverdue
//     case scheduledDue
//     case scheduledOverdueFavor
//     case scheduledDueFavor
//     case scheduledIncompleteFavor
//     case notScheduledIncomplete
//     case notScheduledComplete

//     var scheduled: Bool {
//         switch self {
//         case .scheduledIncomplete,
//              .scheduledComplete,
//              .scheduledOverdue,
//              .scheduledDue,
//              .scheduledDueFavor,
//              .scheduledOverdueFavor,
//              .scheduledIncompleteFavor: return true

//         default: return false
//         }
//     }

//     var completed: Bool {
//         switch self {
//         case .scheduledComplete, .notScheduledComplete: return true
//         default: return false
//         }
//     }
// }
