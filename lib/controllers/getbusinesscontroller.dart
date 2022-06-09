import 'package:get/get.dart';
import 'package:ajosuite_saver/services/backend.dart';

class GetBusinessController extends GetxController {
  Backend backend = Backend();
  RxString phone = " ".obs;
  RxList businesses = [].obs;

  loadbusiness() async {
    dynamic bodydata;
    await backend.getbusiness(data: phone.value).then((value) {
      // businesses.addAll(value["bisnesses"]);
      businesses.assignAll(value["bisnesses"]);
      bodydata = value;
      return bodydata;
    });
    return bodydata;
  }
}
