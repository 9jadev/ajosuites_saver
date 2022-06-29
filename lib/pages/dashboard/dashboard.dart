import 'package:ajosuite_saver/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:ajosuite_saver/utilities/util.dart';
import 'package:flutter/services.dart';
import 'package:ajosuite_saver/controllers/dashboard/homecontroller.dart';
import 'package:ajosuite_saver/components/shimmers/savingshimmer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<RefreshIndicatorState> refreshkey =
      GlobalKey<RefreshIndicatorState>();
  int? cardstatus = 0;
  List labels = ["Account Balance", "Saving Balance", "Withdrawn Balance"];
  String? accountbalance = "0";
  String? savingsbalance = "0";
  String? withdrawalbalance = "0";
  String? Fcm = "";

  List? transactions = [];

  final hompage = Get.put(HomePageController());

  @override
  void initState() {
    getfiretoken();
    print(hompage.userdata.value);
    super.initState();
  }

  getfiretoken() async {
    await FirebaseMessaging.instance.getToken().then((value) {
      setState(() {
        Fcm = value;
      });
      loadbusiness();
      loadtransaction();
    });
  }

  reload() async {
    getfiretoken();
    await hompage.gettransactions().then((val) {
      print(val["transactions"]);
      if (val["status"] == "success") {
        hompage.loadtransactions.value = false;
        hompage.loadtransactionsdata.value = val["transactions"]["data"];
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

  Future loadbusiness() async {
    // context.loaderOverlay.show();
    await hompage.getbalances(Fcm!).then((val) {
      print(val);
      // context.loaderOverlay.hide();
      if (val["status"] == "success") {
        if (!hompage.loadedbefore.value) {
          hompage.loadedbefore.value = true;
          hompage.firstbalanceload.value = false;
        }

        hompage.accountbalance?.value = val["saver_balance"].toString();
        hompage.savingsbalance?.value = val["savings"].toString();
        hompage.withdrawalbalance?.value = val["withdrawal"].toString();

        return;
      }
      if (val["status"] == "error") {
        snackbar(message: val["message"], header: "", bcolor: error);
        setState(() {
          hompage.firstbalanceload.value = false;
        });
        return;
      }
    }).catchError((_) {
      print(_);
      // context.loaderOverlay.hide();
    });
  }

  Future loadtransaction() async {
    await hompage.gettransactions().then((val) {
      print(val["transactions"]);
      if (val["status"] == "success") {
        hompage.loadtransactions.value = false;
        hompage.loadtransactionsdata.value = val["transactions"]["data"];
        return;
      }
      if (val["status"] == "error") {
        // snackbar(message: val["message"], header: "", bcolor: error);

        hompage.loadtransactions.value = false;

        return;
      }
    }).catchError((_) {
      print(_);
      // context.loaderOverlay.hide();
    });
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
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: RefreshIndicator(
            displacement: 250,
            key: refreshkey,
            backgroundColor: scaffoldBackgroundColor,
            color: primary,
            strokeWidth: 3,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () => reload(),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 100.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Obx(
                      () => Visibility(
                        visible: hompage.firstbalanceload.value,
                        child: Container(
                          // height: 130,
                          width: 100.w,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(right: 10, left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: primary,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Shimmer.fromColors(
                                      baseColor:
                                          HexColor("#0093A2").withOpacity(0.7),
                                      highlightColor:
                                          HexColor("#0093A2").withOpacity(0.4),
                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: success.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        padding: EdgeInsets.all(5),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Shimmer.fromColors(
                                      baseColor:
                                          HexColor("#0093A2").withOpacity(0.7),
                                      highlightColor:
                                          HexColor("#0093A2").withOpacity(0.4),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left: 10,
                                        ),
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: HexColor("#DAA21C")
                                              .withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        padding: EdgeInsets.all(5),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Shimmer.fromColors(
                                      baseColor:
                                          HexColor("#0093A2").withOpacity(0.5),
                                      highlightColor:
                                          HexColor("#0093A2").withOpacity(0.2),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          top: 10,
                                        ),
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: HexColor("#0093A2")
                                              .withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        padding: EdgeInsets.all(5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: !hompage.firstbalanceload.value,
                        child: Container(
                          // height: 130,
                          width: 100.w,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(right: 10, left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: primary,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: HexColor("#0093A2")
                                            .withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Saved Balance",
                                            style: TextStyle(
                                              color: white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Flexible(
                                            child: Text(
                                              stringamount(hompage
                                                  .savingsbalance?.value),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: white,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: HexColor("#0093A2")
                                            .withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Withdrawn Balance",
                                            style: TextStyle(
                                              color: white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Flexible(
                                            child: Text(
                                              stringamount(hompage
                                                  .withdrawalbalance?.value),
                                              maxLines: 2,
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                color: white,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: 10,
                                      ),
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: HexColor("#0093A2")
                                            .withOpacity(0.5),
                                      ),
                                      padding: EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Account Balance",
                                            style: TextStyle(
                                              color: white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Flexible(
                                            child: Text(
                                              stringamount(hompage
                                                  .accountbalance?.value),
                                              maxLines: 2,
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                color: white,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Transactions",
                        style: kpagelabel,
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: hompage.loadtransactions.value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10,
                          ),
                          child: Column(children: [
                            Savingshimmer(),
                            Savingshimmer(),
                            Savingshimmer(),
                            Savingshimmer(),
                            Savingshimmer(),
                            Savingshimmer(),
                            Savingshimmer(),
                          ]),
                        ),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: !hompage.loadtransactions.value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10,
                          ),
                          child: Column(
                            children: hompage.loadtransactionsdata
                                .map(
                                  (item) => GestureDetector(
                                    onTap: () {
                                      if (item["type"].toString() ==
                                          "savings") {
                                        Get.toNamed("dashboard/singlesavings",
                                            arguments: item["savings_serial"]
                                                .toString());
                                        return;
                                      } else {
                                        Get.toNamed(
                                          "dashboard/singlewithdrawal",
                                          arguments: item,
                                        );
                                        return;
                                      }
                                    },
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
                                          width: 1,
                                          style: BorderStyle.solid,
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
                                              item["type"] == "savings"
                                                  ? FontAwesome5Regular
                                                      .money_bill_alt
                                                  : Ionicons.stats_chart,
                                              color: item["type"] == "savings"
                                                  ? primary
                                                  : success,
                                              size: 10,
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Visibility(
                                                visible:
                                                    item["type"] == "savings",
                                                child: Text(
                                                  "Saving: " +
                                                      item["savings_serial"]
                                                          .toString(),
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible:
                                                    item["type"] != "savings",
                                                child: Text(
                                                  "Withdrawal Id: " +
                                                      item["withdrawal_id"]
                                                          .toString(),
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                stringamount(item["amount"]),
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Text(
                                                dateformater(
                                                    item["created_at"]),
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: !hompage.loadtransactions.value &&
                            hompage.loadtransactionsdata.isEmpty,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                                      "No Transaction Data",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "No available record of transaction present at this time.",
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
                        ),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: hompage.loadtransactionsdata.isNotEmpty &&
                            hompage.loadtransactionsdata.length > 4,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextButton(
                              onPressed: () =>
                                  Get.toNamed("dashboard/moretransactions"),
                              child: Text(
                                "Load More",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: primary,
                                ),
                              ),
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
        ),
      ),
    );
  }
}
