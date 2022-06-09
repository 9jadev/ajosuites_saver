import 'package:get/get.dart';
import 'package:ajosuite_saver/services/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HomePageController extends GetxController {
  Backend backend = Backend();
  dynamic userdata = {}.obs;
  RxBool firstbalanceload = true.obs;
  RxString? accountbalance = "0".obs;
  RxString? savingsbalance = "0".obs;
  RxString? withdrawalbalance = "0".obs;
  dynamic withdrawal_next = null;
  RxBool loadedbefore = false.obs;
  RxBool loadtransactions = true.obs;
  RxList loadtransactionsdata = [].obs;
  RxBool loadedbeforewith = false.obs;
  RxBool loadwith = true.obs;
  RxList withdrawals = [].obs;
  RxList activeSavings = [].obs;
  RxList completedSavings = [].obs;
  RxList blockedSavings = [].obs;
  RxList withdrawnSavings = [].obs;
  RxBool loadingSavings = true.obs;
  RxBool savingsLoadedbefore = false.obs;

  @override
  void onInit() {
    checkLogin();
    getusers();
    super.onInit();
  }

  checkLogin() async {
    SharedPreferences authstorage = await SharedPreferences.getInstance();
    dynamic token = authstorage.getString("accessToken").toString();
    if (token == null) {
      Get.offNamed("/login");
    }
  }

  updateuser(var user) async {
    SharedPreferences authstorage = await SharedPreferences.getInstance();
    authstorage.setString('saver', json.encode(user));
  }

  getusers() async {
    SharedPreferences authstorage = await SharedPreferences.getInstance();
    String? user = authstorage.getString('saver').toString();
    userdata.value = jsonDecode(user);
    print(userdata?.value);
  }

  getbalances(String token) async {
    dynamic bodydata;
    print(token + " token kvoe");
    final Map data = {"saver_token": token};
    await backend.getbalances(data: data).then((value) {
      bodydata = value;
      return bodydata;
    });
    return bodydata;
  }

  gettransactions() async {
    dynamic bodydata;
    // final Map data = {"saver_token": "wedwimd"};
    await backend.gettransactions().then((value) {
      bodydata = value;
      return bodydata;
    });
    return bodydata;
  }

  getwithdrawal() async {
    dynamic bodydata;
    // final Map data = {"saver_token": "wedwimd"};
    await backend.getwithdrawal().then((value) {
      bodydata = value;
      return bodydata;
    });
    return bodydata;
  }

  getsavings() async {
    dynamic bodydata;
    final Map data = {"page_number": "100"};
    await backend.getsavings(data: data).then((value) {
      bodydata = value;
      return bodydata;
    });
    return bodydata;
  }

  loadmore(String? nextpage) async {
    dynamic bodydata;
    final Map data = {};
    await backend.paginator(data: data, url: nextpage!).then((value) {
      bodydata = value;
      return bodydata;
    });
    return bodydata;
  }
}
