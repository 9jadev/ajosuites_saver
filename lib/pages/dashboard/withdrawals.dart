import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:ajosuite_saver/style.dart';
import 'package:get/get.dart';
import 'package:ajosuite_saver/utilities/util.dart';
import 'package:ajosuite_saver/controllers/dashboard/homecontroller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:ajosuite_saver/components/shimmers/savingshimmer.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter/cupertino.dart';

class WithdrawalPage extends StatefulWidget {
  const WithdrawalPage({Key? key}) : super(key: key);

  @override
  State<WithdrawalPage> createState() => _WithdrawalPageState();
}

class _WithdrawalPageState extends State<WithdrawalPage> {
  final hompage = Get.put(HomePageController());
  final ScrollController _scrollController = ScrollController();
  bool loadmore = false;
  String? next_page_url = null;

  Future refreshWith() async {
    hompage.loadwith.value = true;
    hompage.withdrawals.value = [];
    setState(() {
      loadmore = false;
      next_page_url = null;
    });
    getwithdrawal();
  }

  Future getwithdrawal() async {
    await hompage.getwithdrawal().then((val) {
      if (val["status"] == "success") {
        // if (!hompage.loadwith.value) {
        //   hompage.loadwith.value = false;
        //   hompage.loadedbeforewith.value = false;
        // }
        hompage.loadwith.value = false;
        setState(() {
          next_page_url = val["withdrawal"]["next_page_url"];
        });
        hompage.withdrawals.value = val["withdrawal"]["data"];
        print(hompage.withdrawals);
        return;
      }
      if (val["status"] == "error") {
        snackbar(message: val["message"], header: "", bcolor: error);

        hompage.loadtransactions.value = false;

        return;
      }
    }).catchError((_) {
      print(_);
      // context.loaderOverlay.hide();
    });
  }

  Future loadMore() async {
    setState(() {
      loadmore = true;
    });
    await hompage.loadmore(next_page_url).then((val) {
      setState(() {
        loadmore = false;
      });
      if (val["status"] == "success") {
        hompage.loadwith.value = false;
        setState(() {
          next_page_url = val["withdrawal"]["next_page_url"];
        });
        hompage.withdrawals.addAll(val["withdrawal"]["data"]);
        print(hompage.withdrawals);

        return;
      }
      if (val["status"] == "error") {
        snackbar(message: val["message"], header: "", bcolor: error);

        hompage.loadtransactions.value = false;
        setState(() {
          loadmore = false;
        });
        return;
      }
    }).catchError((_) {
      print(_);
      // context.loaderOverlay.hide();
    });
  }

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getwithdrawal();
      _scrollController.addListener(() {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent) {
          if (hompage.loadwith.value == false && next_page_url != null) {
            print('object ${hompage.withdrawal_next}');
            loadMore();
            return;
          }
        }
      });
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
      body: SizedBox(
        height: 100.h,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "Withdrawals",
                        style: kpagelabel,
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => Visibility(
                          visible: hompage.loadwith.value,
                          child: Column(
                            children: [
                              Savingshimmer(),
                              Savingshimmer(),
                              Savingshimmer(),
                              Savingshimmer(),
                              Savingshimmer(),
                              Savingshimmer(),
                            ],
                          ),
                        ),
                      ),
                      Obx(
                        () => Visibility(
                          visible: !hompage.loadwith.value,
                          child: RefreshIndicator(
                            onRefresh: () => refreshWith(),
                            child: ListView.builder(
                              controller: _scrollController,
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: hompage.withdrawals.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                // return new Text(hompage.withdrawals[index]);
                                if (hompage.withdrawals.isNotEmpty) {
                                  return GestureDetector(
                                    onTap: () => Get.toNamed(
                                      "dashboard/singlewithdrawal",
                                      arguments: hompage.withdrawals[index],
                                    ),
                                    child: Container(
                                      // height: 50,
                                      width: 100.w,
                                      margin: EdgeInsets.only(bottom: 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: savingcard.withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: primary.withOpacity(0.5),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            // alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: white,
                                            ),
                                            child: Icon(
                                              Ionicons.stats_chart,
                                              color: success,
                                              size: 10,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Withdrawal Id: " +
                                                    hompage.withdrawals[index]
                                                            ["withdrawal_id"]
                                                        .toString(),
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Text(
                                                stringamount(hompage
                                                    .withdrawals[index]
                                                        ["amount"]
                                                    .toString()),
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Text(
                                                dateformater(
                                                    hompage.withdrawals[index]
                                                        ["created_at"]),
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                                if (hompage.withdrawals.isEmpty) {
                                  return Container(
                                    // height: 50,
                                    width: 100.w,
                                    margin: EdgeInsets.only(bottom: 10),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: savingcard.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      "No Withdrawal Data",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  );
                                }
                                return SizedBox();
                              },
                            ),
                          ),
                        ),
                      ),
                      // Visibility(
                      //   visible: next_page_url != null && loadmore == false,
                      //   child: Center(
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(top: 10, bottom: 10),
                      //       child: Row(
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Icon(
                      //             Ionicons.folder,
                      //             color: primary,
                      //             size: 10,
                      //           ),
                      //           SizedBox(width: 10),
                      //           Text(
                      //             "Load More",
                      //             style: TextStyle(
                      //               fontWeight: FontWeight.w300,
                      //               color: primary,
                      //               fontSize: 10,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      Visibility(
                        visible:
                            next_page_url == null && !hompage.loadwith.value,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  "No more data",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: primary,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Visibility(
                        visible: loadmore,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CupertinoActivityIndicator(
                                  animating: true,
                                  color: primary,
                                  radius: 10,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Loading",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: primary,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
