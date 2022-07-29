import 'dart:convert';

import 'package:ajosuite_saver/style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:ajosuite_saver/utilities/util.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:ajosuite_saver/controllers/getbusinesscontroller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GetBusiness extends StatefulWidget {
  const GetBusiness({Key? key}) : super(key: key);

  @override
  State<GetBusiness> createState() => _GetBusinessState();
}

class _GetBusinessState extends State<GetBusiness> {
  TextEditingController phonecontroller = TextEditingController();
  GetBusinessController getbus = Get.find<GetBusinessController>();

  List<String> animalNames = ['Elephant', 'Tiger', 'Kangaroo'];
  List<String> animalFamily = ['Elephantidae', 'Panthera', 'Macropodidae'];
  List<String> animalLifeSpan = ['60-70', '8-10', '15-20'];
  List<String> animalWeight = ['2700-6000', '90-310', '47-66'];
  int selectedTile = 0;

  void validate() {
    FocusScope.of(context).unfocus();
    if (getbus.phone.value.length < 11) {
      snackbar(
        message: "Phone number should more than 10 characters.",
        header: '',
        bcolor: error,
      );
      return;
    }
    loadbusiness();
  }

  Future loadbusiness() async {
    context.loaderOverlay.show();
    await getbus.loadbusiness().then((val) {
      print(val);
      context.loaderOverlay.hide();
      if (val["status"] == "success") {
        blockbutton();
        return;
      }
      if (val["status"] == "error") {
        snackbar(message: val["message"], header: "", bcolor: error);
        return;
      }
    }).catchError((_) {
      print(_);
      context.loaderOverlay.hide();
    });
  }

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
                  color: white, borderRadius: BorderRadius.circular(20)),
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
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      height: 1.3,
                    ),
                  ),
                  Text(
                    "Enter phone number below to search for business.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: buttoncolor,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      // height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: phonecontroller,
                    autofocus: true,
                    onChanged: (val) {
                      getbus.phone.value = val;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.dialpad,
                        color: inpuTextColor,
                      ),
                    ),
                  ),
                  InkWell(
                    // onTap: () => Get.offAllNamed("login"),
                    onTap: () {
                      validate();
                    },
                    child: Container(
                      width: 100.w,
                      height: 50,
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: buttoncolor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Text(
                "Enter phone number above to search for business.",
                // textAlign: TextAlign.justify,
                style: TextStyle(
                  color: white,
                  fontWeight: FontWeight.w400,
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
      initialChildSize: .5,
      minChildSize: .1,
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
                    "Businesses",
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Obx(
                    () => Visibility(
                      visible: getbus.businesses.isNotEmpty,
                      child: Expanded(
                        flex: 1,
                        child: ListView.builder(
                          itemCount: getbus.businesses.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return InkWell(
                              onTap: () => Get.offAllNamed(
                                "login",
                                parameters: {
                                  "business": jsonEncode(
                                    getbus.businesses[index],
                                  ),
                                },
                              ),
                              child: Container(
                                height: 70,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: savingcard.withOpacity(0.4),
                                  border: Border.all(
                                    color: primary.withOpacity(0.5),
                                    width: 1,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: getbus.businesses[index]
                                          ["logo"],
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              CircularProgressIndicator(
                                        value: downloadProgress.progress,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 192, 240, 194),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        getbus.businesses[index]
                                            ["business_name"],
                                        // "wcdmw",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
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
                  ),
                  Obx(
                    () => Visibility(
                      visible: getbus.businesses.isEmpty,
                      child: Expanded(
                        flex: 1,
                        child: ListView(
                          children: [
                            Container(
                              height: 70,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: success.withOpacity(0.4),
                                border: Border.all(
                                  color: success.withOpacity(0.5),
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.folder,
                                    color: primary,
                                    size: 30,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      "No Business Available.",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                ],
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
        );
      },
    );
  }
}
