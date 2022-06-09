import 'package:get/get.dart';
import 'package:ajosuite_saver/services/backend.dart';

class ForgotPasswordController extends GetxController {
  Backend backend = Backend();
  // RxString phone = "".obs;
  dynamic data = {
    "business_id": "",
    "phone": "",
  }.obs;

  getlogin() async {
    dynamic bodydata;
    await backend.getlogin(data: data).then((value) {
      bodydata = value;
      return bodydata;
    });
    return bodydata;
  }
}
