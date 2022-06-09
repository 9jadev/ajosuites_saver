import 'package:ajosuite_saver/components/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ajosuite_saver/style.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:ajosuite_saver/controllers/dashboard/homecontroller.dart';

class SavingCirle extends StatefulWidget {
  const SavingCirle({Key? key}) : super(key: key);

  @override
  State<SavingCirle> createState() => _SavingCirleState();
}

class _SavingCirleState extends State<SavingCirle> {
  final hompage = Get.put(HomePageController());
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Text(
            //   "Saving Circle",
            //   style: kpagelabel,
            // ),
            const SizedBox(height: 20),
            Expanded(
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
                        "Coming Soon",
                        style: TextStyle(
                          fontSize: 20,
                          color: primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Saving Cirles allow you to joint already existing saving rings created and manage buy your business.",
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
            )
          ],
        ),
      ),
    );
  }
}
