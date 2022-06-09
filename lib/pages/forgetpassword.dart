import 'dart:convert';

import 'package:ajosuite_saver/style.dart';
import 'package:ajosuite_saver/utilities/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:ajosuite_saver/controllers/forgetpasswordcontroller.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  ForgotPasswordController forgot = Get.find<ForgotPasswordController>();
  dynamic business;

  @override
  void initState() {
    setState(() {
      business = jsonDecode(Get.parameters["business"]!);
    });
    super.initState();
  }

  void validate() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_formKey.currentState?.validate() != false) {
      _formKey.currentState?.save();
      forgot.data["business_id"] = business["business_id"];
      print(forgot.data);
      forget();
      // loginMethod();
      // Get.offAllNamed("dashboard/home");
    }
  }

  forget() {
    context.loaderOverlay.show();
    forgot.getlogin().then((val) {
      context.loaderOverlay.hide();
      // print(val);
      if (val["status"] == "success") {
        snackbar(message: val["message"], header: "Success", bcolor: success);
        return;
      }
      if (val["status"] == "success") {
        snackbar(message: val["message"], header: "Error", bcolor: error);
        return;
      }
    }).catchError((_) {
      print(_);
      context.loaderOverlay.hide();
    });
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Your phone number is required for you to reset your password.",
                    style: TextStyle(
                      color: navgrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      // height: 1.9,
                    ),
                  ),
                ),
                Expanded(
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
                                  "Phone",
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
                                  // validator: RequiredValidator(
                                  //     errorText: 'Phone number is required.'),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'Phone number is required.'),
                                    MinLengthValidator(10,
                                        errorText:
                                            "Phone number should be at least 10 characters")
                                  ]),
                                  onSaved: (val) {
                                    forgot.data["phone"] = val;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Enter Phone",
                                    hintStyle: hintextstyle,
                                  ),
                                ),
                                const SizedBox(height: 15),
                              ],
                            )),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Get.toNamed("login", parameters: business);
                                Get.toNamed("login", parameters: {
                                  "business": jsonEncode(
                                    business,
                                  ),
                                });
                              },
                              child: Text(
                                "Already have an account ?",
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
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    // onTap: () => Get.offAllNamed("login"),
                    onTap: () => validate(),
                    // onTap: () {
                    //   print(business);
                    // },
                    child: Container(
                      width: 100.w,
                      height: 50,
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
