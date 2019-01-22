import 'package:table/data/index.dart';

import 'package:app/utils/sort.dart';

import '_public_activity.dart';
import '_section.dart';

class Sections {
  static final _completionsSectionData =
      StreamableTableSectionData<PublicActivityData>(
          headerData: StreamableTableSectionHeaderData(title: "Completions"),
          criteria: (data) => data.type == PublicActivityType.completion,
          sort: Sort.revCron);

  static final _expenseSectionData =
      StreamableTableSectionData<PublicActivityData>(
          headerData: StreamableTableSectionHeaderData(title: "Expenses"),
          criteria: (data) => data.type == PublicActivityType.expense,
          sort: Sort.revCron);

  static final _transferSectionData =
      StreamableTableSectionData<PublicActivityData>(
          headerData: StreamableTableSectionHeaderData(title: "Transfers"),
          criteria: (data) => data.type == PublicActivityType.transfer,
          sort: Sort.revCron);

  static final _landlordTransfersSectionData =
      StreamableTableSectionData<PublicActivityData>(
          headerData:
              StreamableTableSectionHeaderData(title: "Landlord Transfers"),
          criteria: (data) => data.type == PublicActivityType.landlordTransfer,
          sort: Sort.revCron);

  static final _maintenanceSectionData =
      StreamableTableSectionData<PublicActivityData>(
          headerData: StreamableTableSectionHeaderData(title: "Maintenance"),
          criteria: (data) => data.type == PublicActivityType.maintenance,
          sort: Sort.revCron);

  static StreamableTableSectionData dataForSection(Section section) {
    switch (section) {
      case Section.completions:
        return _completionsSectionData;
      case Section.expenses:
        return _expenseSectionData;
      case Section.transfers:
        return _transferSectionData;
      case Section.landlordTransfers:
        return _landlordTransfersSectionData;
      case Section.maintenance:
        return _maintenanceSectionData;
    }

    return null;
  }
}
