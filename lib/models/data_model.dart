import 'dart:math';

import 'package:data_architecture/functions/utils.dart';
import 'package:flutter/material.dart';

import '../data/notifiers/manage_notifier.dart';

class DataModel {
  late final String activity;
  late final String type;
  late final String participants;
  late final String price;
  late final String link;
  late final String key;
  late final String accessibility;

  DataModel(
      {required this.activity,
      required this.type,
      required this.participants,
      required this.price,
      required this.link,
      required this.key,
      required this.accessibility});

  Future<void> reset() async {
    await setDataNotifier();
  }

  void logData() {
    String current = fromMaptoString(map: dataMapCurrent);
    String internal = fromMaptoString(map: dataMapInternal);
    String external = fromMaptoString(map: dataMapExternal);
    debugPrint("Current: $current");
    debugPrint("Internal: $internal");
    debugPrint("External: $external");
  }
}
