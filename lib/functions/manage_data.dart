import 'package:data_architecture/data/dio.dart';
import 'package:data_architecture/data/shared_pref.dart';
import 'package:data_architecture/functions/utils.dart';

Future<Map<String, dynamic>> getExternalData() async {
  Map<String, dynamic> map = await getHttp();
  String jsonString = fromMaptoString(map: map);
  await saveNewInternalData(externalDataString: jsonString);
  return map;
}

Future<void> saveNewInternalData({required String externalDataString}) async {
  sharedPref.saveInternalData(jsonString: externalDataString);
}

Future<Map<String, dynamic>> getInternalData() async {
  await sharedPref.getData();
  Map<String, dynamic> map = sharedPref.data;
  return map;
}
