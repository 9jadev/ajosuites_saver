import 'package:get/get.dart';
import 'package:ajosuite_saver/services/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginPageController extends GetxController {
  Backend backend = Backend();
  // RxString phone = "".obs;
  dynamic data = {
    "business_id": "",
    "saver_id": "",
    "password": "",
  }.obs;

  login() async {
    dynamic bodydata;
    await backend.login(data: data).then((value) {
      bodydata = value;
      return bodydata;
    });
    return bodydata;
  }

  logging(var user, String token) async {
    SharedPreferences authstorage = await SharedPreferences.getInstance();
    authstorage.setString('saver', json.encode(user));
    // authstorage.setBool('passgetstarted', true);
    authstorage.setString('token', token);
  }

  loggingObj(var user) async {
    SharedPreferences authstorage = await SharedPreferences.getInstance();
    authstorage.setString('moderator', json.encode(user));
    authstorage.setBool('passgetstarted', true);
    // authstorage.setString('token', token);
  }
}
