import 'package:date/index.dart';
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
      {int unreadCommentableObjectCount,
      int pinnedCommentableObjectCount,
      Date startDate,
      Date endDate,
      String name,
      int amount,
      List<ContractUser> users,
      List<ContractUser> formerUsers,
      Schedule schedule,
      NameContractDomain domain,
      int invoiceCount,
      FeePayerType feePayerType,
      bool monthToMonth,
      this.lateFee,
      this.property,
      this.nextInvoiceDeadline,
      this.nextInvoiceType,
      this.openServiceRequestCount,
      this.serviceRequestCompletionCount,
      this.serviceRequestCount})
      : super(
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
    final contract = Contract.fromMap(map);
    final counts = map[Key.counts] as Map;

    return Lease(
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
        nextInvoiceType: InvoiceType.values.firstWhere((value) =>
            value.toString() == 'InvoiceType.' + map[Key.nextInvoiceKind]),
        openServiceRequestCount: counts[Key.openServiceRequest],
        serviceRequestCompletionCount: counts[Key.serviceRequestCompletion],
        serviceRequestCount: counts[Key.serviceRequest]);
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
      Key.nextInvoiceKind: nextInvoiceType.toString().split(".").last
    });

    return map;
  }
}
