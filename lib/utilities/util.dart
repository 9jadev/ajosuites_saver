import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../style.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

snackbar(
    {@required String? message,
    @required String? header,
    @required Color? bcolor}) {
  // Toast.show(
  //   message!,
  //   duration: Toast.lengthShort,
  //   gravity: Toast.bottom,
  //   backgroundColor: bcolor!,
  // );
  Get.snackbar(
    header.toString(), // title
    message.toString(), // message
    // icon: const Icon(Icons.cancel),
    backgroundColor: bcolor,
    colorText: white,
    shouldIconPulse: true,
    // onTap:(){},
    barBlur: 20,
    isDismissible: true,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 3),
  );
}

double checkDouble(dynamic value) {
  if (value is String) {
    return double.parse(value);
  } else if (value is int) {
    return 0.0 + value;
  } else {
    return value;
  }
}

String stringamount(String? value) {
  if (value.toString() == '' || value.toString() == ' ') {
    return 'NGN0';
  }
  if (value == null) {
    return 'NGN0';
  }
  var newPrice = double.parse(value.toString());
  // if (newPrice == null) {

  // }
  String actualPrice = newPrice.toStringAsFixed(0);
  return NumberFormat.currency(name: 'NGN ')
      .format(int.parse(actualPrice))
      .toString();
}

String stringamountprint(String? value) {
  if (value.toString() == '' || value.toString() == ' ') {
    return 'NGN0';
  }
  if (value == null) {
    return 'NGN0';
  }
  var newPrice = double.parse(value.toString());
  String actualPrice = newPrice.toStringAsFixed(0);
  return NumberFormat.currency(name: 'NGN')
      .format(int.parse(actualPrice))
      .toString();
}

String dateformater(String datestring) {
  if (datestring == '' || datestring == 'null') {
    return '';
  }
  return DateFormat('MMM dd, yyyy')
      .format(DateTime.parse(datestring))
      .toString();
}

String singleday(String datestring) {
  if (datestring == '') {
    return '';
  }
  return DateFormat('EE').format(DateTime.parse(datestring)).toString();
}

String singlemonth(String datestring) {
  if (datestring == '') {
    return '';
  }
  return DateFormat('d').format(DateTime.parse(datestring)).toString();
}

String dateformatermon(String datestring) {
  if (datestring == '') {
    return '';
  }
  return DateFormat('MMM EEE dd, yyyy')
      .format(DateTime.parse(datestring))
      .toString();
}

// String capitalize(String stringdata) {
//   return "${stringdata[0].toUpperCase()}${stringdata.substring(1)}";
// }

String dateformaterY_M_D(String datestring) {
  if (datestring == '') {
    return '';
  }
  return DateFormat('yyyy-MM-dd').format(DateTime.parse(datestring)).toString();
}
