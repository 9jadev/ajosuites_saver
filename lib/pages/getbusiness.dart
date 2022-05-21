import 'package:ajosuite_saver/style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';


class GetBusiness extends StatefulWidget {
  const GetBusiness({Key? key}) : super(key: key);

  @override
  State<GetBusiness> createState() => _GetBusinessState();
}

class _GetBusinessState extends State<GetBusiness> {
  TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 140),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
              padding: const EdgeInsets.all(15),
              // height: 400,
              width: 100.w,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/image/ajsuite1.png',
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Ajosuite",
                    style: TextStyle(
                      color: buttoncolor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      height: 1.3,
                    ),
                  ),
                  Text(
                    "Enter phone number below to search for business.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: buttoncolor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: phonecontroller,
                    autofocus: true,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                      color: inpuTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.5
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.dialpad,
                        color: inpuTextColor,
                      )
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.offAllNamed("login"),
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
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left:15.0, right: 15.0),
              child: Text(
                "Enter phone number above to search hone number below to search for business.",
                // textAlign: TextAlign.justify,
                style: TextStyle(
                  color: white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}