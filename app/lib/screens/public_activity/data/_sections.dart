import 'package:table/data/index.dart';

import 'package:app/utils/sort.dart';

import '_public_activity.dart';
import '_section.dart';

final _completionsSectionData = StreamableTableSectionData<PublicActivityData>(
    headerData: StreamableTableSectionHeaderData(title: "Completions"),
    criteria: (data) => data.type == PublicActivityType.completion,
    sort: Sort.revCron);

final _expenseSectionData = StreamableTableSectionData<PublicActivityData>(
    headerData: StreamableTableSectionHeaderData(title: "Expenses"),
    criteria: (data) => data.type == PublicActivityType.expense,
    sort: Sort.revCron);

final _transferSectionData = StreamableTableSectionData<PublicActivityData>(
    headerData: StreamableTableSectionHeaderData(title: "Transfers"),
    criteria: (data) => data.type == PublicActivityType.transfer,
    sort: Sort.revCron);

final _landlordTransfersSectionData =
    StreamableTableSectionData<PublicActivityData>(
        headerData:
            StreamableTableSectionHeaderData(title: "Landlord Transfers"),
        criteria: (data) => data.type == PublicActivityType.landlordTransfer,
        sort: Sort.revCron);

final _maintenanceSectionData = StreamableTableSectionData<PublicActivityData>(
    headerData: StreamableTableSectionHeaderData(title: "Maintenance"),
    criteria: (data) => data.type == PublicActivityType.maintenance,
    sort: Sort.revCron);

final Map<Section, StreamableTableSectionData> sectionDataMap = {
  Section.completions: _completionsSectionData,
  Section.expenses: _expenseSectionData,
  Section.transfers: _transferSectionData,
  Section.landlordTransfers: _landlordTransfersSectionData,
  Section.maintenance: _maintenanceSectionData
};
