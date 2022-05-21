import 'package:ajosuite_saver/style.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 100.h,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Ajo Suite",
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    height: 3.6
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/image/welcomepage.png',
                    // height: 40.h,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 100.w,
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32)
                      )
                    ),
                    child: ListView(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "Welcome to Ajosuite",
                          style: TextStyle(
                            color: HexColor("#1A132F"),
                            fontWeight: FontWeight.w600,
                            fontSize: 40,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Are you ready to uproot and start over in a new area? Ajosuite will help you out!",
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: textonbordcolor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            letterSpacing: 0.28,
                            height: 1.5
                          ),
                        ),

                        InkWell(
                          onTap: () => Get.offAllNamed("getbusiness"),
                          child: Container(
                            width: 100.w,
                            height: 58,
                            margin: const EdgeInsets.only(top: 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: buttoncolor,
                              borderRadius: BorderRadius.circular(6)
                            ),
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                color: white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        )

                      ],
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