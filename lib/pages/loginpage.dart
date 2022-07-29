import 'package:ajosuite_saver/controllers/loginpagecontroller.dart';
import 'package:ajosuite_saver/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:ajosuite_saver/utilities/util.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  LoginPageController login = Get.find<LoginPageController>();
  dynamic business;
  bool showpassword = true;

  toggelpasword(bool pass) {
    setState(() {
      showpassword = pass;
    });
  }

  @override
  void initState() {
    setState(() {
      business = jsonDecode(Get.parameters["business"]!);
    });
    _updateAppbar();
    super.initState();
  }

  void validate() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_formKey.currentState?.validate() != false) {
      _formKey.currentState?.save();
      login.data["business_id"] = business["business_id"];
      print(login.data);
      loginow();
      // loginMethod();
      // Get.offAllNamed("dashboard/home");
    }
  }

  loginow() {
    context.loaderOverlay.show();
    login.login().then((val) {
      context.loaderOverlay.hide();
      // print(val);
      if (val["status"] == "success") {
        snackbar(message: val["message"], header: "Success", bcolor: success);
        login.logging(val["saver"], val["token"]);
        Get.offAllNamed("dashboard/home");
        return;
      }
      if (val["status"] == "error") {
        snackbar(message: val["message"], header: "Error", bcolor: error);
        return;
      }
    }).catchError((_) {
      print(_);
      context.loaderOverlay.hide();
    });
  }

  void _updateAppbar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 100.h,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    InkWell(
                      onTap: () => Get.offAndToNamed("welcomepage"),
                      child: const SizedBox(
                        child: Icon(
                          FontAwesome.angle_left,
                          size: 35,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    'assets/image/ajsuite1.png',
                    height: 150,
                    width: 150,
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Sign In to your Ajosuites account to explore savings and withdrawals data!",
                    style: TextStyle(
                      color: navgrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      // height: 1.9,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Saver ID",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 2.4,
                                    color: inputlabel,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText: "Enter Saver ID",
                                    hintStyle: hintextstyle,
                                  ),
                                  validator: RequiredValidator(
                                      errorText: "Saver ID is required."),
                                  onSaved: (val) {
                                    login.data["saver_id"] = val;
                                  },
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  "Password",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: inputlabel,
                                    fontWeight: FontWeight.w600,
                                    height: 2.4,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  onSaved: (val) {
                                    login.data["password"] = val;
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  obscureText: showpassword,
                                  textInputAction: TextInputAction.next,
                                  validator: RequiredValidator(
                                    errorText: "Password is required.",
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Enter Password",
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: HexColor("#7D7F88"),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () =>
                                          toggelpasword(!showpassword),
                                      icon: Icon(
                                        showpassword
                                            ? Ionicons.eye
                                            : Ionicons.eye_off,
                                        color: HexColor("#7D7F88"),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed("forgotpassword", parameters: {
                                    "business": jsonEncode(
                                      business,
                                    ),
                                  });
                                  // print(business);
                                },
                                child: Text(
                                  "Forgot Password ?",
                                  style: TextStyle(
                                    color: navgrey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // const SizedBox(height: 15),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () {
                      validate();
                    },
                    child: Container(
                      width: 100.w,
                      height: 48,
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: buttoncolor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
