import 'dart:convert';

import 'package:data_architecture/constants.dart';
import 'package:data_architecture/models/data_model.dart';

Map<String, dynamic> fromStringtoMap({required String value}) {
  Map<String, dynamic> map = json.decode(value);
  return map;
}

String fromMaptoString({required Map<String, dynamic> map}) {
  String jsonString = json.encode(map);
  return jsonString;
}

DataModel fromMaptoDataModel({required Map<String, dynamic> map}) {
  return DataModel(
      activity: map[kActivity],
      type: map[kType],
      participants: map[kParticipants].toString(),
      price: map[kPrice].toString(),
      link: map[kLink],
      key: map[kKey],
      accessibility: map[kAccessibility].toString());
}
