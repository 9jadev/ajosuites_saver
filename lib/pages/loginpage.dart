import 'package:ajosuite_saver/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
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
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          "Saver ID",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 2.4,
                            color: inputlabel
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField( 
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Enter Saver ID",
                            hintStyle: hintextstyle
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 16,
                            color: inputlabel,
                            fontWeight: FontWeight.w600,
                            height: 2.4
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField( 
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: HexColor("#7D7F88")
                            ),
                            suffixIcon: Icon(
                              Icons.remove_red_eye,
                              color: HexColor("#7D7F88"),
                            )
                          ),
                        ),
                      ],
                    )
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed("forgotpassword");
                        },
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                            color: navgrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          ),
                          
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 15),
                  
                  
                ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () => Get.offAllNamed("dashboard/home"),
              child: Container(
                width: 100.w,
                height: 58,
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: buttoncolor,
                  borderRadius: BorderRadius.circular(6)
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}