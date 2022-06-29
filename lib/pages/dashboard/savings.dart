import 'package:ajosuite_saver/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ajosuite_saver/components/savingcrad.dart';
import 'package:sizer/sizer.dart';
import 'package:ajosuite_saver/components/shimmers/savingshimmer1.dart';
import 'package:ajosuite_saver/utilities/util.dart';
import 'package:ajosuite_saver/components/savingnone.dart';
import 'package:get/get.dart';
import 'package:ajosuite_saver/controllers/dashboard/homecontroller.dart';

class Savings extends StatefulWidget {
  const Savings({Key? key}) : super(key: key);

  @override
  State<Savings> createState() => _SavingsState();
}

class _SavingsState extends State<Savings> {
  final hompage = Get.put(HomePageController());

  @override
  void initState() {
    getsavings();
    print(hompage.userdata.value);
    super.initState();
  }

  sortsavings(List data) {
    List act = [];
    List comp = [];
    List block = [];
    List withd = [];
    data.forEach((element) {
      if (element["status"].toString() == "0") {
        setState(() {
          act.add(element);
        });
      }
      if (element["status"].toString() == "1") {
        setState(() {
          comp.add(element);
        });
      }
      if (element["status"].toString() == "2") {
        setState(() {
          block.add(element);
        });
      }
      if (element["status"].toString() == "3") {
        setState(() {
          withd.add(element);
        });
      }
    });

    hompage.activeSavings.assignAll(act);
    hompage.completedSavings.assignAll(comp);
    hompage.blockedSavings.assignAll(block);
    hompage.withdrawnSavings.assignAll(withd);
  }

  getsavings() async {
    await hompage.getsavings().then((val) {
      // print(val["transactions"]);
      if (val["status"] == "success") {
        sortsavings(val["savings"]["data"]);
        hompage.loadingSavings.value = false;
        // hompage.loadtransactions.value = false;
        // hompage.loadtransactionsdata.value = val["transactions"]["data"];
        return;
      }
      if (val["status"] == "error") {
        snackbar(message: val["message"], header: "", bcolor: error);
        hompage.loadingSavings.value = false;
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
      body: SizedBox(
        height: 100.h,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView(
                    children: [
                      // const SizedBox(height: 20),
                      Text(
                        "Active Savings",
                        style: kpagelabel,
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => Visibility(
                          visible: hompage.loadingSavings.value,
                          child: Container(
                            height: 130,
                            width: 100.w,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Savingshimming(),
                                Savingshimming(),
                                Savingshimming(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Visibility(
                          visible: !hompage.loadingSavings.value,
                          child: Column(
                            children: [
                              Visibility(
                                visible: hompage.activeSavings.isNotEmpty,
                                child: Container(
                                  height: 130,
                                  width: 100.w,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: hompage.activeSavings.length,
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      return GestureDetector(
                                        onTap: () => Get.toNamed(
                                            "/dashboard/singlesavings",
                                            arguments:
                                                hompage.activeSavings[index]
                                                    ["savings_serial"]),
                                        child: SavingsCard(
                                          savingdata:
                                              hompage.activeSavings[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: hompage.activeSavings.isEmpty,
                                child: Container(
                                  height: 130,
                                  width: 100.w,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 1,
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      return Savingsnone();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Completed Savings",
                        style: kpagelabel,
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => Visibility(
                          visible: hompage.loadingSavings.value,
                          child: Container(
                            height: 130,
                            width: 100.w,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Savingshimming(),
                                Savingshimming(),
                                Savingshimming(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Visibility(
                          visible: !hompage.loadingSavings.value,
                          child: Column(
                            children: [
                              Visibility(
                                visible: hompage.completedSavings.isNotEmpty,
                                child: Container(
                                  height: 130,
                                  width: 100.w,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: hompage.completedSavings.length,
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      return GestureDetector(
                                        onTap: () => Get.toNamed(
                                            "/dashboard/singlesavings",
                                            arguments:
                                                hompage.completedSavings[index]
                                                    ["savings_serial"]),
                                        child: SavingsCard(
                                          savingdata:
                                              hompage.completedSavings[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: hompage.completedSavings.isEmpty,
                                child: Container(
                                  height: 130,
                                  width: 100.w,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 1,
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      return Savingsnone();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Withdrawn Savings",
                        style: kpagelabel,
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => Visibility(
                          visible: hompage.loadingSavings.value,
                          child: Container(
                            height: 130,
                            width: 100.w,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Savingshimming(),
                                Savingshimming(),
                                Savingshimming(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Visibility(
                          visible: !hompage.loadingSavings.value,
                          // visible: true,
                          child: Container(
                            height: 130,
                            width: 100.w,
                            child: Column(
                              children: [
                                Visibility(
                                  visible: hompage.withdrawnSavings.isNotEmpty,
                                  child: Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          hompage.withdrawnSavings.length,
                                      itemBuilder:
                                          (BuildContext ctxt, int index) {
                                        return GestureDetector(
                                          onTap: () => Get.toNamed(
                                              "/dashboard/singlesavings",
                                              arguments: hompage
                                                      .withdrawnSavings[index]
                                                  ["savings_serial"]),
                                          child: SavingsCard(
                                            savingdata:
                                                hompage.withdrawnSavings[index],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: hompage.withdrawnSavings.isEmpty,
                                  child: Expanded(
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Savingsnone(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "BLocked Savings",
                        style: kpagelabel,
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => Visibility(
                          visible: hompage.loadingSavings.value,
                          child: Container(
                            height: 130,
                            width: 100.w,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Savingshimming(),
                                Savingshimming(),
                                Savingshimming(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Visibility(
                          visible: !hompage.loadingSavings.value,
                          child: Container(
                            height: 130,
                            width: 100.w,
                            child: Column(
                              children: [
                                Visibility(
                                  visible: hompage.blockedSavings.isNotEmpty,
                                  child: Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: hompage.blockedSavings.length,
                                      itemBuilder:
                                          (BuildContext ctxt, int index) {
                                        return GestureDetector(
                                          onTap: () => Get.toNamed(
                                              "/dashboard/singlesavings",
                                              arguments:
                                                  hompage.blockedSavings[index]
                                                      ["savings_serial"]),
                                          child: SavingsCard(
                                            savingdata:
                                                hompage.blockedSavings[index],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: hompage.blockedSavings.isEmpty,
                                  child: Expanded(
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [Savingsnone()],
                                    ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
