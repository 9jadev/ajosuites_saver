import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:ajosuite_saver/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:ajosuite_saver/utilities/util.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'dart:async';
import 'package:sizer/sizer.dart';
import 'package:ajosuite_saver/utilities/util.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ajosuite_saver/controllers/dashboard/homecontroller.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ajosuite_saver/controllers/dashboard/addcirclecontroller.dart';

class AddCirclSingle extends StatefulWidget {
  const AddCirclSingle({Key? key}) : super(key: key);

  @override
  State<AddCirclSingle> createState() => _AddCirclSingleState();
}

class _AddCirclSingleState extends State<AddCirclSingle> {
  bool loading = true;
  bool loadingmore = false;
  String? circle_id;
  dynamic singlecircle;
  List? selectdates = [];
  final hompage = Get.put(HomePageController());
  AddCircleController adcircle = Get.find<AddCircleController>();

  initial() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        loading = false;
      });
    });
  }

  addcirle() async {
    Map data = {"circle_id": circle_id};
    await adcircle.singlecircle(data).then((res) {
      setState(() {
        loading = false;
      });
      setState(() {
        singlecircle = res["savingcircle"];
      });
      print(singlecircle);
    });
  }

  Color checkcolor(int? selected_item, String? saver) {
    if (saver != null) {
      // selected_item
      return success;
    }
    if (selected_item == 1) {
      return primary;
    }
    return Color.fromARGB(255, 188, 71, 71);
  }

  IconData checkIcon(int? selected_item, String? saver) {
    if (saver != null) {
      return Ionicons.checkbox_sharp;
    }
    if (selected_item == 1) {
      return Ionicons.copy_sharp;
    }
    return Ionicons.duplicate;
  }

  String checkString(int? selected_item, String? saver) {
    if (saver != null) {
      // selected_item
      return "Already taken";
    }
    if (selected_item == 1) {
      return "Selected";
    }
    return "Available";
  }

  selectdatesUpload() {
    if (selectdates!.isEmpty) {
      snackbar(
        message: "Select some dates to continue.",
        header: "Error",
        bcolor: error,
      );
      return;
    }
    final Map data = {"cicle_id": circle_id, "circles": selectdates};
    print(data);
    joincircle(data);
  }

  joincircle(Map data) async {
    //  await getbus.loadbusiness().then((val) {
    context.loaderOverlay.show();
    await adcircle.joincircle(data).then((val) {
      context.loaderOverlay.hide();
      if (val["status"] == "error") {
        snackbar(message: val["message"], header: "Error", bcolor: error);
        return;
      }
      if (val["status"] == "success") {
        snackbar(message: val["message"], header: "Success", bcolor: success);
        Get.toNamed("/dashboard/home", arguments: 2);
        return;
      }
    });
  }

  @override
  void initState() {
    setState(() {
      circle_id = Get.arguments;
    });
    addcirle();
    super.initState();
  }

  selesctDates(dynamic saver) {
    if (saver["saver_id"] != null) {
      snackbar(
        message: "Slot already taken by another saver.",
        header: "Slot Error",
        bcolor: error,
      );
      return;
    }
    if (selectdates!.contains(saver)) {
      List sdt = selectdates!;
      List newlist = [];
      sdt.forEach((item) {
        if (item["id"] != saver["id"]) {
          newlist.add(item);
        }
      });
      print(sdt.length);
      setState(() {
        selectdates = newlist;
      });
      setState(() {
        singlecircle["circle_interval"]!.forEach((element) {
          if (element["date"] == saver["date"]) {
            if (element["selected_item"] == 1) {
              element["selected_item"] = null;
            } else {
              element["selected_item"] = 1;
            }
          }
        });
      });
      return;
    } else {
      setState(() {
        singlecircle["circle_interval"]!.forEach((element) {
          if (element["date"] == saver["date"]) {
            if (element["selected_item"] == 1) {
              element["selected_item"] = null;
            } else {
              element["selected_item"] = 1;
            }
          }
        });
      });
      // print(singlecircle["circle_interval"]);
      setState(() {
        selectdates!.add(saver);
      });
    }
    // return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: primary,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome,',
              style: TextStyle(
                fontSize: 12,
                color: white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Obx(
              () => Text(
                // "Ahamba Solomon",
                hompage.userdata["name"],
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  color: white,
                  overflow: TextOverflow.clip,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed("dashboard/profile"),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => CachedNetworkImage(
                  imageUrl: hompage.userdata["logo"].toString(),
                  imageBuilder: (context, imageProvider) => Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 192, 240, 194),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: loading
          ? Center(
              child: CupertinoActivityIndicator(
                animating: true,
                color: primary,
                radius: 15,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100.w,
                  margin: EdgeInsets.all(10),
                  decoration: cirleboxstyle,
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Circle ID: ",
                              style: kpagelabel,
                            ),
                            Text(
                              circle_id.toString(),
                              style: kpagelabel,
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Circle type: ",
                              style: kpagelabel,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              decoration: BoxDecoration(
                                color: success,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                singlecircle["type"].toString(),
                                style: TextStyle(
                                  color: white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Cricle Intervals: ",
                              style: kpagelabel,
                            ),
                            Text(
                              singlecircle["circle_interval"].length.toString(),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Saving amount: ",
                              style: kpagelabel,
                            ),
                            Text(
                              stringamount(singlecircle["amount"].toString()),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Saving total: ",
                              style: kpagelabel,
                            ),
                            Text(
                              stringamount(
                                singlecircle["proximate_amount"].toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Start Date: ",
                              style: kpagelabel,
                            ),
                            Text(
                              dateformater(
                                  singlecircle["start_date"].toString()),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "End Date: ",
                              style: kpagelabel,
                            ),
                            Text(
                              dateformater(singlecircle["end_date"].toString()),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: CircularPercentIndicator(
                          radius: 125.0,
                          lineWidth: 10.0,
                          percent: singlecircle["members_pecentage"].toDouble(),
                          // center: new Text(
                          //     (singlecircle["members_pecentage"] * 100)
                          //             .toDouble()
                          //             .toString() +
                          //         "%"),
                          center: Text(double.parse(
                                      (singlecircle["members_pecentage"] * 100)
                                          .toStringAsFixed(2))
                                  .toString() +
                              "%"),
                          progressColor: primary,
                          circularStrokeCap: CircularStrokeCap.round,
                          animateFromLastPercent: true,
                        ),
                      ),
                      // SizedBox(height: 10),
                    ],
                  ),
                ),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" Interval count(s): " +
                          selectdates!.length.toString()),
                      SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: primary,
                          onPrimary: Colors.white,
                          onSurface: Colors.grey,
                          minimumSize: const Size(120, 40),
                          maximumSize: const Size(120, 40),
                        ),
                        onPressed: () => selectdatesUpload(),
                        child: Text(
                          "Continue",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: ListView.builder(
                        itemCount: singlecircle["circle_interval"].length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => selesctDates(
                                singlecircle["circle_interval"][index]),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        dateformater(
                                            singlecircle["circle_interval"]
                                                    [index]["date"]
                                                .toString()),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        checkString(
                                          singlecircle["circle_interval"][index]
                                              ["selected_item"],
                                          singlecircle["circle_interval"][index]
                                              ["saver_id"],
                                        ),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                          color: checkcolor(
                                            singlecircle["circle_interval"]
                                                [index]["selected_item"],
                                            singlecircle["circle_interval"]
                                                [index]["saver_id"],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    // Ionicons.duplicate,
                                    checkIcon(
                                      singlecircle["circle_interval"][index]
                                          ["selected_item"],
                                      singlecircle["circle_interval"][index]
                                          ["saver_id"],
                                    ),
                                    color: checkcolor(
                                      singlecircle["circle_interval"][index]
                                          ["selected_item"],
                                      singlecircle["circle_interval"][index]
                                          ["saver_id"],
                                    ),
                                  ),
                                ],
                              ),
                              decoration: cirleboxstyle,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //   onPrimary: Colors.black87,
                //   primary: Colors.grey[300],
                //   minimumSize: Size(88, 36),
                //   padding: EdgeInsets.symmetric(horizontal: 16),
                // shape: ElevatedButton.styleFrom(
                //   primary: ThemeColors.darkBg,
                //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.black)),
                //   ),
                //   onPressed: () { },
                //   child: Text('Looks like a RaisedButton'),
                // )
              ],
            ),
    );
  }
}
