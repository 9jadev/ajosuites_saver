import 'package:ajosuite_saver/style.dart';
import 'package:ajosuite_saver/utilities/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:dartx/dartx.dart';
import 'package:flutter/services.dart';
import 'package:number_to_words_english/number_to_words_english.dart';

class Singlewithdrawal extends StatefulWidget {
  const Singlewithdrawal({Key? key}) : super(key: key);

  @override
  State<Singlewithdrawal> createState() => _SinglewithdrawalState();
}

class _SinglewithdrawalState extends State<Singlewithdrawal> {
  dynamic withdrawaldata;

  @override
  void initState() {
    // print(Get.arguments);
    setState(() {
      withdrawaldata = Get.arguments;
    });
    print(withdrawaldata);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //   return AnimatedContainer(
    //     curve: Curves.linear,
    //     color: primary.withOpacity(0.2),
    //     width: 200.0, // change width or height to see animation
    //     height: 200.0,
    //     duration: const Duration(seconds: 2),
    //   );
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        leading: Center(
          child: Image.asset(
            'assets/image/ajsuite1.png',
            height: 70,
            width: 70,
          ),
        ),
        title: Text(
          "Withdrawal Transactions.",
          style: TextStyle(
            fontSize: 20,
            color: primary.withOpacity(0.9),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: scaffoldBackgroundColor,
      body: Column(
        children: [
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.teal.shade100.withOpacity(0.4),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Withdrawal Date",
                      style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      dateformater(withdrawaldata["created_at"].toString()),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                // color: Colors.teal.shade100.withOpacity(0.4),
                ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Withdrawal Amount",
                      style: TextStyle(
                        color: primary,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(stringamount(withdrawaldata["amount"])),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 60,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Amount in words",
                      style: TextStyle(
                        color: primary,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(right: 5),
                    child: Text(
                      NumberToWordsEnglish.convert(
                                  int.parse(withdrawaldata["amount"]!))
                              .capitalize
                              .toString() +
                          ' naira'.capitalize.toString(),
                    ),
                  ),
                )
              ],
            ),
          ),
          // SizedBox(height: 10),
          Container(
            height: 60,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Savings Reference",
                      style: TextStyle(
                        color: primary,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(right: 5),
                    child: Text(withdrawaldata["savings_id"].toString()),
                  ),
                )
              ],
            ),
          ),
          // SizedBox(height: 10),
          Container(
            height: 60,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Withdrawal Reference",
                      style: TextStyle(
                        color: primary,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(right: 5),
                    child: Text(withdrawaldata["withdrawal_id"].toString()),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 60,
            width: double.infinity,
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Text(
                "Done",
                style: TextStyle(
                  fontSize: 15,
                  color: primary.withOpacity(0.9),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
