import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './apptoken.dart';
import 'dart:convert';

class Backend {
  final Dio _dio = Dio()..interceptors.add(Logging());
  final _baseUrl = 'https://ajosuites.herokuapp.com/api/v1/';
  // final _baseUrl = 'https://5b83-102-221-238-6.ngrok.io/api/v1/';
  authtoken() async {
    SharedPreferences authstorage = await SharedPreferences.getInstance();
    dynamic auth = authstorage.getString("token").toString();
    return auth;
  }

  Future<dynamic> getbusiness({required String data}) async {
    dynamic otpresponse;
    try {
      Response responseobj = await _dio.get(
        '${_baseUrl}saver/getbusiness/${data}',
      );
      otpresponse = responseobj.data;
    } on DioError catch (e) {
      if (e.response != null) {
        // print('DATA: ${e.response?.data}');
        otpresponse = e.response?.data;
      } else {
        otpresponse = {
          "status": "error",
          "message": "Error occured (Network Connection)"
        };
        return otpresponse;
      }
      return otpresponse;
    }
    return otpresponse;
  }

  Future<dynamic> login({required Map data}) async {
    dynamic otpresponse;
    try {
      Response responseobj = await _dio.post(
        '${_baseUrl}saver/login',
        data: jsonEncode(data),
      );
      otpresponse = responseobj.data;
    } on DioError catch (e) {
      if (e.response != null) {
        // print('DATA: ${e.response?.data}');
        otpresponse = e.response?.data;
      } else {
        otpresponse = {
          "status": "error",
          "message": "Error occured (Network Connection)"
        };
        return otpresponse;
      }
      return otpresponse;
    }
    return otpresponse;
  }

  Future<dynamic> getlogin({required Map data}) async {
    dynamic otpresponse;
    try {
      Response responseobj = await _dio.post(
        '${_baseUrl}saver/getlogin',
        data: jsonEncode(data),
      );
      otpresponse = responseobj.data;
    } on DioError catch (e) {
      if (e.response != null) {
        // print('DATA: ${e.response?.data}');
        otpresponse = e.response?.data;
      } else {
        otpresponse = {
          "status": "error",
          "message": "Error occured (Network Connection)"
        };
        return otpresponse;
      }
      return otpresponse;
    }
    return otpresponse;
  }

  Future<dynamic> getbalances({required Map data}) async {
    dynamic otpresponse;
    try {
      String token = await authtoken();
      print(token);
      Response responseobj = await _dio.post(
        '${_baseUrl}saver/list/balances',
        data: jsonEncode(data),
        options: Options(
          headers: {
            "authorization": 'Bearer $token',
            "Accept": "application/json"
          },
        ),
      );
      otpresponse = responseobj.data;
    } on DioError catch (e) {
      if (e.response != null) {
        // print('DATA: ${e.response?.data}');
        otpresponse = e.response?.data;
      } else {
        otpresponse = {
          "status": "error",
          "message": "Error occured (Network Connection)"
        };
        return otpresponse;
      }
      return otpresponse;
    }
    return otpresponse;
  }

  Future<dynamic> gettransactions() async {
    dynamic otpresponse;
    try {
      String token = await authtoken();
      print(token);
      Response responseobj = await _dio.get(
        '${_baseUrl}saver/transactions',
        // data: jsonEncode(data),
        options: Options(
          headers: {
            "authorization": 'Bearer $token',
            "Accept": "application/json"
          },
        ),
      );
      otpresponse = responseobj.data;
    } on DioError catch (e) {
      if (e.response != null) {
        // print('DATA: ${e.response?.data}');
        otpresponse = e.response?.data;
      } else {
        otpresponse = {
          "status": "error",
          "message": "Error occured (Network Connection)"
        };
        return otpresponse;
      }
      return otpresponse;
    }
    return otpresponse;
  }

  Future<dynamic> getwithdrawal() async {
    dynamic otpresponse;
    try {
      String token = await authtoken();
      print(token);
      Response responseobj = await _dio.post(
        '${_baseUrl}saver/list/withdrawal',
        // data: jsonEncode(data),
        options: Options(
          headers: {
            "authorization": 'Bearer $token',
            "Accept": "application/json"
          },
        ),
      );
      otpresponse = responseobj.data;
    } on DioError catch (e) {
      if (e.response != null) {
        // print('DATA: ${e.response?.data}');
        otpresponse = e.response?.data;
      } else {
        otpresponse = {
          "status": "error",
          "message": "Error occured (Network Connection)"
        };
        return otpresponse;
      }
      return otpresponse;
    }
    return otpresponse;
  }

  Future<dynamic> singelsavings(String data) async {
    dynamic otpresponse;
    try {
      String token = await authtoken();
      print(token);
      Response responseobj = await _dio.get(
        '${_baseUrl}saver/savings/${data}',
        // data: jsonEncode(data),
        options: Options(
          headers: {
            "authorization": 'Bearer $token',
            "Accept": "application/json"
          },
        ),
      );
      otpresponse = responseobj.data;
    } on DioError catch (e) {
      if (e.response != null) {
        // print('DATA: ${e.response?.data}');
        otpresponse = e.response?.data;
      } else {
        otpresponse = {
          "status": "error",
          "message": "Error occured (Network Connection)"
        };
        return otpresponse;
      }
      return otpresponse;
    }
    return otpresponse;
  }

  Future<dynamic> getsavings({required Map data}) async {
    dynamic otpresponse;
    try {
      String token = await authtoken();
      print(token);
      Response responseobj = await _dio.post(
        '${_baseUrl}saver/list/savings',
        data: jsonEncode(data),
        options: Options(
          headers: {
            "authorization": 'Bearer $token',
            "Accept": "application/json"
          },
        ),
      );
      otpresponse = responseobj.data;
    } on DioError catch (e) {
      if (e.response != null) {
        // print('DATA: ${e.response?.data}');
        otpresponse = e.response?.data;
      } else {
        otpresponse = {
          "status": "error",
          "message": "Error occured (Network Connection)"
        };
        return otpresponse;
      }
      return otpresponse;
    }
    return otpresponse;
  }

  Future<dynamic> moretransactions({required Map data}) async {
    dynamic otpresponse;
    try {
      String token = await authtoken();
      print(token);
      Response responseobj = await _dio.post(
        '${_baseUrl}saver/moretransactions',
        data: jsonEncode(data),
        options: Options(
          headers: {
            "authorization": 'Bearer $token',
            "Accept": "application/json"
          },
        ),
      );
      otpresponse = responseobj.data;
    } on DioError catch (e) {
      if (e.response != null) {
        // print('DATA: ${e.response?.data}');
        otpresponse = e.response?.data;
      } else {
        otpresponse = {
          "status": "error",
          "message": "Error occured (Network Connection)"
        };
        return otpresponse;
      }
      return otpresponse;
    }
    return otpresponse;
  }

  Future<dynamic> paginator({required Map data, required String url}) async {
    dynamic responsedata;
    try {
      String token = await authtoken();
      // print(token);
      Response responseobj = await _dio.post(
        url,
        data: data,
        options: Options(
          headers: {
            "authorization": 'Bearer $token',
            "Accept": "application/json"
          },
        ),
      );
      responsedata = responseobj.data;
    } on DioError catch (e) {
      if (e.response != null) {
        // print('DATA: ${e.response?.data}');
        responsedata = e.response?.data;
      } else {
        responsedata = {
          "status": "error",
          "message": "An unknown error occured try again later."
        };
        return responsedata;
      }
      return responsedata;
    }
    return responsedata;
  }
}
