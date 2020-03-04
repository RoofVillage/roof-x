import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:network/index.dart';
import 'package:public/index.dart';

import 'utils/index.dart';
import '_param.dart' as _param;

class PublicActivity {
  Future<List<Object>> get({
    num pageSize,
    num pageNumber = 0,
    num startTimestamp = 0,
  }) async {
    final params = {
      _param.pageSize: pageSize,
      _param.pageNumber: pageNumber,
      _param.startTimestamp: startTimestamp
    };

    final response = await post(
      service: Service.activity,
      params: params,
    );

    final objects = await compute<PostResponse, List<Object>>(
      _streamableDataFromResponse,
      response,
    );

    return objects;
  }
}

List<Object> _streamableDataFromResponse(PostResponse response) {
  final dataConvertedToJson = response.body;
  final List publicActivity = dataConvertedToJson[_param.publicActivity];

  if (publicActivity == null) return [];

  final data = publicActivity.map((json) {
    switch (json[_param.activityType]) {
      case _param.completion:
        return PublicCompletion.fromMap(json);
      case _param.expense:
        return PublicExpense.fromMap(json);
      case _param.transfer:
        return PublicTransfer.fromMap(json);
      case _param.landlordTransfer:
        return PublicLandlordTransfer.fromMap(json);
      case _param.maintenance:
        return PublicMaintenanceRequest.fromMap(json);
      default:
        return null;
    }
  }).toList();

  return data;
}
