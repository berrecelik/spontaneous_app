import 'package:data_architecture/data/notifiers/manage_notifier.dart';
import 'package:data_architecture/data/shared_pref.dart';

Future<void> initApp() async {
  await initSharedPref();
  await initDataNotifier();
}

Future<void> initSharedPref() async {
  await sharedPref.init();
}

Future<void> initDataNotifier() async {
  await setDataNotifier();
}
