import 'package:meta/meta.dart';
import 'package:fee_payer_type/index.dart';
import 'package:assignment_type/index.dart';
import 'package:date/index.dart';
import 'package:user_reference/index.dart';
import 'package:stub/index.dart';
import 'package:date_parts/index.dart';
import 'package:name_user/index.dart';
import 'package:commentable_object/index.dart';
import 'package:completion_count/index.dart';
import 'package:schedule/index.dart';
import 'package:context/index.dart';
import 'package:name_defining_object/index.dart';
import 'package:name_formatter/index.dart';
import 'package:key/index.dart' as _key;

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

    final participants = (map[_key.participants] as List)
        .map((map) => UserReference.fromMap(map));
    final completingUsers = (map[_key.completingUsers] as List)
        .map((map) => UserReference.fromMap(map));
    final assignedUsers = (map[_key.assignedUsers] as List)
        .map((map) => UserReference.fromMap(map));
    final completionCounts = (map[_key.completionCounts] as List)
        .map((map) => CompletionCount.fromMap(map));

    final counts = map[_key.counts] as Map;

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
        latestActivation:
            Date.fromSecondsSinceEpoch(map[_key.latestActivation]),
        latestCompletion:
            Date.fromSecondsSinceEpoch(map[_key.latestCompletion]),
        completionCounts: completionCounts.toSet(),
        schedule: Schedule.fromMap(map[_key.schedule]),
        deadline: Date.fromSecondsSinceEpoch(map[_key.deadline]),
        assignmentType: AssignmentType.fromString(map[_key.assigmentKind]),
        deadlineParts: DateParts.fromMap(map[_key.deadlineParts]),
        currentlyCompleted: map[_key.currentlyCompleted],
        completionCount: counts[_key.completion],
        completionPrize: map[_key.completionPrize]);
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    (map[_key.counts] as Map).addAll({_key.completion: completionCount});

    map.addAll({
      _key.participants: participants.map((participant) => participant.toMap()),
      _key.completingUsers:
          completingUsers.map((completingUser) => completingUser.toMap()),
      _key.assignedUsers:
          assignedUsers.map((assignedUser) => assignedUser.toMap()),
      _key.latestActivation: latestActivation.secondsSinceEpoch,
      _key.latestCompletion: latestCompletion.secondsSinceEpoch,
      _key.completionCounts:
          completionCounts.map((completionCount) => completionCount.toMap()),
      _key.schedule: schedule.toMap(),
      _key.deadline: deadline.secondsSinceEpoch,
      _key.assigmentKind: assignmentType.toString(),
      _key.deadlineParts: deadlineParts.toMap(),
      _key.currentlyCompleted: currentlyCompleted,
      _key.completionPrize: completionPrize
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
    return formatNames(
        guids: assignedUsers.map((user) => user.guid),
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        firstPerson: firstPerson);
  }

  String formattedParticipants(
      {String sessionOwnerGuid,
      @required NameDefiningObject nameDefiningObject,
      bool firstPerson = false}) {
    return formatNames(
        guids: participants.map((user) => user.guid),
        sessionOwnerGuid: sessionOwnerGuid,
        nameDefiningObject: nameDefiningObject,
        firstPerson: firstPerson);
  }

  String formattedCompletingUsers(
      {String sessionOwnerGuid,
      @required NameDefiningObject nameDefiningObject,
      bool firstPerson = false}) {
    return formatNames(
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
