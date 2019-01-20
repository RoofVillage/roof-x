import 'package:roofui_kit/stream/roofui_streamable_data.dart';
import './_public_activity_data.dart';

final _completionsSectionData = RoofUIStreamableSectionData<PublicActivityData>(
    headerData: RoofUIStreamableSectionHeaderData(title: "Completions"),
    criteria: (data) => data.type == PublicActivityType.completion,
    compare: Compare.revCron);

final _expenseSectionData = RoofUIStreamableSectionData<PublicActivityData>(
    headerData: RoofUIStreamableSectionHeaderData(title: "Expenses"),
    criteria: (data) => data.type == PublicActivityType.expense,
    compare: Compare.revCron);

final _transferSectionData = RoofUIStreamableSectionData<PublicActivityData>(
    headerData: RoofUIStreamableSectionHeaderData(title: "Transfers"),
    criteria: (data) => data.type == PublicActivityType.transfer,
    compare: Compare.revCron);

final _landlordTransfersSectionData =
    RoofUIStreamableSectionData<PublicActivityData>(
        headerData:
            RoofUIStreamableSectionHeaderData(title: "Landlord Transfers"),
        criteria: (data) => data.type == PublicActivityType.landlordTransfer,
        compare: Compare.revCron);

final _maintenanceSectionData = RoofUIStreamableSectionData<PublicActivityData>(
    headerData: RoofUIStreamableSectionHeaderData(title: "Maintenance"),
    criteria: (data) => data.type == PublicActivityType.maintenance,
    compare: Compare.revCron);

final Map<Section, RoofUIStreamableSectionData> sectionDataMap = {
  Section.completions: _completionsSectionData,
  Section.expenses: _expenseSectionData,
  Section.transfers: _transferSectionData,
  Section.landlordTransfers: _landlordTransfersSectionData,
  Section.maintenance: _maintenanceSectionData
};

enum Section implements iii {
  completions,
  expenses,
  transfers,
  landlordTransfers,
  maintenance
}

class iii<T> {
  List<T> values;
}
