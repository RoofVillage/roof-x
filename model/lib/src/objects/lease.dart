import 'package:date/index.dart';
import 'package:meta/meta.dart';
import 'package:types/index.dart';
import '../utils/index.dart';

import '../abstract/index.dart';
import '../properties/index.dart';

class Lease extends Contract {
  final LateFee lateFee;
  final NameProperty property;
  final Date nextInvoiceDeadline;
  final InvoiceType nextInvoiceType;
  final int openServiceRequestCount;
  final int serviceRequestCompletionCount;
  final int serviceRequestCount;

  Lease(
      {@required String guid,
      @required Date dateCreated,
      @required String creatorGuid,
      @required int unreadCommentableObjectCount,
      @required int pinnedCommentableObjectCount,
      @required Date startDate,
      @required Date endDate,
      String name,
      @required int amount,
      @required Set<ContractUser> users,
      @required Set<ContractUser> formerUsers,
      @required Schedule schedule,
      NameContractDomain domain,
      @required int invoiceCount,
      @required FeePayerType feePayerType,
      @required bool monthToMonth,
      this.lateFee,
      @required this.property,
      this.nextInvoiceDeadline,
      this.nextInvoiceType,
      @required this.openServiceRequestCount,
      @required this.serviceRequestCompletionCount,
      @required this.serviceRequestCount})
      : assert(property != null),
        assert(openServiceRequestCount != null),
        assert(serviceRequestCompletionCount != null),
        assert(serviceRequestCount != null),
        super(
            guid: guid,
            dateCreated: dateCreated,
            creatorGuid: creatorGuid,
            unreadCommentableObjectCount: unreadCommentableObjectCount,
            pinnedCommentableObjectCount: pinnedCommentableObjectCount,
            startDate: startDate,
            endDate: endDate,
            name: name,
            amount: amount,
            users: users,
            formerUsers: formerUsers,
            schedule: schedule,
            domain: domain,
            invoiceCount: invoiceCount,
            feePayerType: feePayerType,
            monthToMonth: monthToMonth);

  factory Lease.fromMap(Map<String, Object> map) {
    assert(map != null);

    final contract = Contract.fromMap(map);
    final counts = map[Key.counts] as Map;

    return Lease(
        guid: contract.guid,
        dateCreated: contract.dateCreated,
        creatorGuid: contract.creatorGuid,
        unreadCommentableObjectCount: contract.unreadCommentableObjectCount,
        pinnedCommentableObjectCount: contract.pinnedCommentableObjectCount,
        startDate: contract.startDate,
        endDate: contract.endDate,
        name: contract.name,
        amount: contract.amount,
        users: contract.users,
        formerUsers: contract.formerUsers,
        schedule: contract.schedule,
        domain: contract.domain,
        invoiceCount: contract.invoiceCount,
        feePayerType: contract.feePayerType,
        monthToMonth: contract.monthToMonth,
        lateFee: LateFee.fromMap(map[Key.lateFee]),
        property: NameProperty.fromMap(map[Key.property]),
        nextInvoiceDeadline:
            Date.fromSecondsSinceEpoch(map[Key.nextInvoiceDeadline]),
        nextInvoiceType: InvoiceType.fromString(map[Key.nextInvoiceKind]),
        openServiceRequestCount: counts[Key.openServiceRequest] ?? 0,
        serviceRequestCompletionCount:
            counts[Key.serviceRequestCompletion] ?? 0,
        serviceRequestCount: counts[Key.serviceRequest] ?? 0);
  }

  Map<String, Object> toMap() {
    final map = super.toMap();
    (map[Key.counts] as Map).addAll({
      Key.openServiceRequest: openServiceRequestCount,
      Key.serviceRequestCompletion: serviceRequestCompletionCount,
      Key.serviceRequest: serviceRequestCount
    });

    map.addAll({
      Key.lateFee: lateFee.toMap(),
      Key.property: property.toMap(),
      Key.nextInvoiceDeadline: nextInvoiceDeadline.secondsSinceEpoch,
      Key.nextInvoiceKind: nextInvoiceType.toString()
    });

    return map;
  }
}
