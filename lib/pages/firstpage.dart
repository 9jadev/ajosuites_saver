import 'package:ajosuite_saver/style.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstaPage extends StatefulWidget {
  const FirstaPage({Key? key}) : super(key: key);

  @override
  State<FirstaPage> createState() => _FirstaPageState();
}

class _FirstaPageState extends State<FirstaPage> {
  dynamic token;

  initial() {
    Timer(Duration(seconds: 3), () {
      if (token == null) {
        Get.offAllNamed("welcomepage");
        return;
      }
      if (token != null) {
        Get.offAllNamed("dashboard/home");
        return;
      }
    });
  }

  checkpassgetstarted() async {
    SharedPreferences authstorage = await SharedPreferences.getInstance();
    setState(() {
      token = authstorage.getString("token");
    });
    initial();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkpassgetstarted();
    });
    // initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: primary,
        elevation: 0,
      ),
      backgroundColor: primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // SizedBox(height: 17.h),
            const SizedBox(height: 20, width: double.infinity),
            Text(
              "Ajosuite Saver",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  height: 4.8,
                  color: white),
            ),
            Text(
              "Loading Please wait...",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 2.4,
                color: white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
