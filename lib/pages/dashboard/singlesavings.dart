import 'package:ajosuite_saver/style.dart';
import 'package:ajosuite_saver/utilities/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:ajosuite_saver/controllers/dashboard/singlesavingcontroller.dart';

class SingleSavings extends StatefulWidget {
  const SingleSavings({Key? key}) : super(key: key);

  @override
  State<SingleSavings> createState() => _SingleSavingsState();
}

class _SingleSavingsState extends State<SingleSavings> {
  SingleSavingsController singlesavings = Get.find<SingleSavingsController>();

  bool loading = true;
  String? savingId;
  dynamic savings;
  List<dynamic>? savingslog;

  @override
  void initState() {
    setState(() {
      savingId = Get.arguments;
    });
    print(savingId);
    getsinglesavings();
    super.initState();
  }

  Color sortcolor(String id) {
    if (id == "0") {
      return primary.withOpacity(0.5);
    }
    if (id == '1' || id == '2') {
      return success.withOpacity(0.5);
    }
    return error.withOpacity(0.5);
  }

  getsinglesavings() {
    singlesavings.getsinglesavings(savingId!).then((res) {
      if (res["status"] == "success") {
        setState(() {
          loading = false;
          savings = res["savings"];
          savingslog = res["savings"]["savingslog"];
        });
      }
      // console.log(res)
      print(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        title: Text("Savings"),
      ),
      body: loading
          ? Center(
              child: CupertinoActivityIndicator(
                animating: true,
                color: primary,
                radius: 15,
              ),
            )
          : ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Container(
                      width: 100.w,
                      padding: EdgeInsets.only(bottom: 5),
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            savings["savings_serial"].toString(),
                            style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text("Saving ID"),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.w,
                      padding: EdgeInsets.only(bottom: 5),
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stringamount(
                                savings["saving_total_amount"].toString()),
                            style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text("Total Amount"),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.w,
                      padding: EdgeInsets.only(bottom: 5),
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stringamount(savings["saving_amount"].toString()),
                            style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text("Recuring Payment Amount"),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.w,
                      padding: EdgeInsets.only(bottom: 5),
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stringamount(
                              savings["savedamount"].toString(),
                            ),
                            style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text("Saved Amount"),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.w,
                      padding: EdgeInsets.only(bottom: 5),
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            savings["saving_interval"].toString(),
                            style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text("Total interval"),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.w,
                      padding: EdgeInsets.only(bottom: 5),
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            savings["paid_interval"].toString(),
                            style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text("Paid Interval"),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.w,
                      padding: EdgeInsets.only(bottom: 5),
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dateformater(savings["start_date"]),
                            style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text("Start Date"),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.w,
                      padding: EdgeInsets.only(bottom: 5),
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dateformater(savings["end_date"]),
                            style: TextStyle(
                              color: black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 7),
                          Text("End Date"),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.w,
                      padding: EdgeInsets.only(bottom: 5),
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 3, bottom: 3),
                            decoration: BoxDecoration(
                              color: success,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              savings["savings_type"],
                              style: TextStyle(
                                color: white,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(height: 7),
                          Text("Savings Type"),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.w,
                      padding: EdgeInsets.only(bottom: 5),
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: savings["status"] == "0",
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "Active",
                                style: TextStyle(
                                  color: white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: savings["status"] == "1",
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                color: success,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "Compeleted",
                                style: TextStyle(
                                  color: white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: savings["status"] == "2",
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                color: error,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "Blocked",
                                style: TextStyle(
                                  color: white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: savings["status"] == "3",
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                color: success,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "Withdrawn",
                                style: TextStyle(
                                  color: white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 7),
                          Text("Savings Status"),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () => blockbutton(),
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        width: 100.w,
                        alignment: Alignment.center,
                        child: Text(
                          "View Saving Interval",
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(height: 55),
                  ],
                ),
              ),
            ),
    );
  }

  blockbutton() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return bottomModal(context);
      },
    );
  }

  Widget bottomModal(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: .7,
      minChildSize: 0.1,
      maxChildSize: 1,
      builder: (BuildContext context, ScrollController scrollController) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    "Saving Invervals",
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Visibility(
                    visible: true,
                    child: Expanded(
                      flex: 1,
                      child: ListView.builder(
                        itemCount: savingslog!.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return InkWell(
                            child: Container(
                              height: 70,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: savingcard.withOpacity(0.4),
                                border: Border.all(
                                  color: sortcolor(
                                      savingslog![index]["status"].toString()),
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dateformater(savingslog![index]
                                                  ["expected_paid_date"]
                                              .toString()),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Visibility(
                                                visible: savingslog![index]
                                                            ["status"]
                                                        .toString() ==
                                                    "0",
                                                child: Text("Awaiting Payment"),
                                              ),
                                              Visibility(
                                                visible: savingslog![index]
                                                            ["status"]
                                                        .toString() ==
                                                    "1",
                                                child: Text("Paid"),
                                              ),
                                              Visibility(
                                                visible: savingslog![index]
                                                            ["status"]
                                                        .toString() ==
                                                    "2",
                                                child: Text("Withdrawn"),
                                              ),
                                            ],
                                          ),
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          margin: EdgeInsets.only(top: 4),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color: sortcolor(
                                                  savingslog![index]["status"]
                                                      .toString()),
                                              style: BorderStyle.solid,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
