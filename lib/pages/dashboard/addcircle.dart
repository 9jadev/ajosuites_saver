import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ajosuite_saver/style.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:sizer/sizer.dart';
import 'package:ajosuite_saver/utilities/util.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ajosuite_saver/controllers/dashboard/homecontroller.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ajosuite_saver/controllers/dashboard/addcirclecontroller.dart';

class JoinCircle extends StatefulWidget {
  const JoinCircle({Key? key}) : super(key: key);

  @override
  State<JoinCircle> createState() => _JoinCircleState();
}

class _JoinCircleState extends State<JoinCircle> {
  bool loading = true;
  bool loadingmore = false;
  final hompage = Get.put(HomePageController());
  AddCircleController adcircle = Get.find<AddCircleController>();
  ScrollController _scrollController = ScrollController();
  int? page_number = 10;
  List? circles = [];
  dynamic savingcircle;

  initial() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        loading = false;
      });
    });
  }

  addcirle() async {
    Map data = {"page_number": page_number.toString()};
    await adcircle.addcicrle(data).then((res) {
      print(res["savingcircle"]["data"]);
      setState(() {
        circles = res["savingcircle"]["data"];
        savingcircle = res["savingcircle"];
        loading = false;
      });
    });
  }

  loadMore() async {
    Map data = {"page_number": page_number.toString()};
    setState(() {
      loadingmore = true;
    });
    print(savingcircle);
    await adcircle.loadMore(data, savingcircle["next_page_url"]).then((res) {
      print(res["savingcircle"]["data"]);
      setState(() {
        circles!.addAll(res["savingcircle"]["data"]);
        savingcircle = res["savingcircle"];
        loading = false;
        loadingmore = false;
      });
    });
  }

  @override
  void initState() {
    // initial();
    addcirle();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        if (loadingmore == false && savingcircle["next_page_url"] != null) {
          loadMore();
        }
        // if (hompage.loadwith.value == false && next_page_url != null) {
        //   print('object ${hompage.withdrawal_next}');
        //   loadMore();
        //   return;
        // }
      }
    });
    super.initState();
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
          : ScrollConfiguration(
              behavior: MyBehavior(),
              child: Column(
                children: [
                  Visibility(
                    visible: circles!.isNotEmpty,
                    child: RefreshIndicator(
                      onRefresh: () => addcirle(),
                      color: primary,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Column(
                                children: circles!
                                    .map(
                                      (i) => GestureDetector(
                                        onTap: () => Get.toNamed(
                                          "dashboard/joincirclesingle",
                                          arguments: i["cicle_id"],
                                        ),
                                        child: Container(
                                          width: 100.w,
                                          margin:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Contirbution: ${stringamount(i["amount"].toString())} Weekly",
                                                style: TextStyle(
                                                  color: primary,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              Text(
                                                "Estimated collection: ${stringamount(i["proximate_amount"].toString())}",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              Text(
                                                "Amount of payment: ${i["members_count"].toString()}",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${i["members_count"]} slot(s)",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                  LinearPercentIndicator(
                                                    percent: double.parse(
                                                      i["members_pecentage"]
                                                          .toString(),
                                                      // double.parse(
                                                      //   (i["members_pecentage"])
                                                      //       .toStringAsFixed(2),
                                                      // ).toString(),
                                                    ),
                                                    progressColor: primary,
                                                    lineHeight: 6,
                                                    width: 260,
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          padding: EdgeInsets.all(5),
                                          decoration: cirleboxstyle,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              Visibility(
                                visible: loadingmore == true &&
                                    savingcircle["next_page_url"] != null,
                                child: Center(
                                  // child: Text("Load More"),
                                  child: Column(
                                    children: [
                                      CupertinoActivityIndicator(
                                        animating: true,
                                        color: primary,
                                        radius: 15,
                                      ),
                                      Text("Loading")
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: circles!.isEmpty,
                    child: Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/image/404.png',
                                // height: 40.h,
                              ),
                              SizedBox(height: 20),
                              Text(
                                "No cIrcle Available",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "There is no open circle at this time try again later.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: primary,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
