import 'package:get/get.dart';
import 'package:ajosuite_saver/services/backend.dart';

class SavingPageController extends GetxController {
  Backend backend = Backend();
// singelsavings

  getsinglesavings(String data) async {
    dynamic bodydata;
    await backend.singelsavings(data).then((value) {
      bodydata = value;
      return bodydata;
    });
    return bodydata;
  }
}