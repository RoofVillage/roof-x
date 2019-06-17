import 'dart:async';

import 'package:table_builder/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:decorated_text/index.dart';
import 'package:app_data/index.dart';
import 'package:sorting/index.dart';
import 'package:public/index.dart';

enum Section {
  completions,
  expenses,
  transfers,
  landlordTransfers,
  maintenance
}

mixin PublicActivityArtboardData implements TableBuilder {
  Future<List<StreamableTableSectionData>> get sectionData async => [
        _completionsSectionData,
        _expenseSectionData,
        _transferSectionData,
        _landlordTransfersSectionData,
        _maintenanceSectionData
      ];

  @override
  Future<List<CellAData>> get rowData async {
    //Format it the activity into streamable data on different thread.
    final objects = await PublicActivity().get(pageSize: 50);

    final rowData = objects.map((object) {
      if (object is PublicCompletion) return _dataForCompletion(object);
      if (object is PublicExpense) return _dataForExpense(object);
      if (object is PublicTransfer) return _dataForTransfer(object);
      if (object is PublicLandlordTransfer)
        return _dataForLandlordTransfer(object);
      if (object is PublicMaintenanceRequest)
        return _dataForMaintenance(object);
    }).toList();

    return rowData;
  }

  final _completionsSectionData =
      StreamableTableSectionData<CellAData>.withTitle(
    "Completions",
    criteria: (data) =>
        data.section ==
        Section.values.indexOf(
          Section.completions,
        ),
    sort: revCron,
  );

  final _expenseSectionData = StreamableTableSectionData<CellAData>.withTitle(
    "Expenses",
    criteria: (data) =>
        data.section ==
        Section.values.indexOf(
          Section.expenses,
        ),
    sort: revCron,
  );

  final _transferSectionData = StreamableTableSectionData<CellAData>.withTitle(
    "Transfers",
    criteria: (data) =>
        data.section ==
        Section.values.indexOf(
          Section.transfers,
        ),
    sort: revCron,
  );

  final _landlordTransfersSectionData =
      StreamableTableSectionData<CellAData>.withTitle(
    "Landlord Transfers",
    criteria: (data) =>
        data.section ==
        Section.values.indexOf(
          Section.landlordTransfers,
        ),
    sort: revCron,
  );

  final _maintenanceSectionData =
      StreamableTableSectionData<CellAData>.withTitle(
    "Maintenance",
    criteria: (data) =>
        data.section ==
        Section.values.indexOf(
          Section.maintenance,
        ),
    sort: revCron,
  );

  CellAData _dataForCompletion(PublicCompletion publicCompletion) {
    final decoratedTitle = WeightDecoratedText();

    decoratedTitle.addSection(text: publicCompletion.who);
    decoratedTitle.addSection(text: 'completed', thin: true);
    decoratedTitle.addSection(text: publicCompletion.name);
    decoratedTitle.addSection(text: 'at', thin: true);
    decoratedTitle.addSection(text: publicCompletion.roof);

    return CellAData(
      title: decoratedTitle,
      description: publicCompletion.note,
      iconReference: StandardIcon.complete,
      section: Section.values.indexOf(Section.completions),
      timestamp: 12221,
    );
  }

  CellAData _dataForExpense(PublicExpense publicExpense) {
    final decoratedTitle = WeightDecoratedText();

    decoratedTitle.addSection(text: publicExpense.who);
    decoratedTitle.addSection(text: 'split an expense at', thin: true);
    decoratedTitle.addSection(text: publicExpense.roof);

    return CellAData(
      title: decoratedTitle,
      description: publicExpense.note,
      iconReference: StandardIcon.piggyBank,
      section: Section.values.indexOf(Section.expenses),
      timestamp: 9012,
    );
  }

  CellAData _dataForTransfer(PublicTransfer publicTransfer) {
    final decoratedTitle = WeightDecoratedText();

    decoratedTitle.addSection(text: publicTransfer.payer);
    decoratedTitle.addSection(text: 'paid', thin: true);
    decoratedTitle.addSection(text: publicTransfer.receiver);
    decoratedTitle.addSection(text: 'at', thin: true);
    decoratedTitle.addSection(text: publicTransfer.roof);

    return CellAData(
      title: decoratedTitle,
      description: publicTransfer.note,
      iconReference: StandardIcon.cashSack,
      section: Section.values.indexOf(Section.transfers),
      timestamp: 122,
    );
  }

  CellAData _dataForLandlordTransfer(
      PublicLandlordTransfer publicLandlordTransfer) {
    final decoratedTitle = WeightDecoratedText();

    decoratedTitle.addSection(text: publicLandlordTransfer.who);
    decoratedTitle.addSection(text: 'at', thin: true);
    decoratedTitle.addSection(text: publicLandlordTransfer.home);
    decoratedTitle.addSection(text: 'paid', thin: true);
    decoratedTitle.addSection(text: publicLandlordTransfer.name);
    decoratedTitle.addSection(text: 'to', thin: true);
    decoratedTitle.addSection(text: publicLandlordTransfer.landlord);

    return CellAData(
      title: decoratedTitle,
      description: publicLandlordTransfer.note,
      iconReference: StandardIcon.cashSack,
      section: Section.values.indexOf(Section.landlordTransfers),
      timestamp: 201,
    );
  }

  CellAData _dataForMaintenance(
      PublicMaintenanceRequest publicMaintenanceRequest) {
    final decoratedTitle = WeightDecoratedText();

    decoratedTitle.addSection(text: publicMaintenanceRequest.who);
    decoratedTitle.addSection(text: 'resolved', thin: true);
    decoratedTitle.addSection(text: publicMaintenanceRequest.name);
    decoratedTitle.addSection(text: 'at', thin: true);
    decoratedTitle.addSection(text: publicMaintenanceRequest.home);

    return CellAData(
      title: decoratedTitle,
      description: publicMaintenanceRequest.note,
      iconReference: StandardIcon.toolbox,
      section: Section.values.indexOf(Section.maintenance),
      timestamp: 1901,
    );
  }
}
