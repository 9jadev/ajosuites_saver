import 'package:ajosuite_saver/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ajosuite_saver/controllers/dashboard/homecontroller.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final hompage = Get.put(HomePageController());
  bool showamount = true;
  logout() async {
    SharedPreferences authstorage = await SharedPreferences.getInstance();
    authstorage.remove('saver');
    authstorage.remove('token');
    Get.offAllNamed("/getbusiness");
  }

  previewprofile() {
    final imageProvider = Image.network(
      hompage.userdata["logo"].toString(),
    ).image;
    showImageViewer(context, imageProvider, onViewerDismissed: () {
      print("dismissed");
    });
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () => logout(),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning"),
      content: Text("Are u sure you want to logout."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Column(
        children: [
          SafeArea(
            child: Container(
              width: 100.w,
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: BoxDecoration(
                  // color: error,
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          child: Icon(
                            Ionicons.chevron_back_outline,
                            color: Colors.white,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(1),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome,',
                            style: TextStyle(
                              fontSize: 16,
                              color: scaffoldBackgroundColor,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Obx(
                            () => Text(
                              hompage.userdata["name"].toString(),
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16,
                                color: white,
                                overflow: TextOverflow.clip,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => previewprofile(),
                    child: Obx(
                      () => CachedNetworkImage(
                        imageUrl: hompage.userdata["logo"].toString(),
                        // imageUrl:
                        //     "https://avatars1.githubusercontent.com/u/45692276?v=4",
                        imageBuilder: (context, imageProvider) => Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 192, 240, 194),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "Show Balances",
          //         style: TextStyle(
          //           color: white,
          //           fontSize: 15,
          //           fontWeight: FontWeight.w300,
          //         ),
          //       ),
          //       Switch(
          //         value: showamount,
          //         inactiveTrackColor: scaffoldBackgroundColor,
          //         activeTrackColor: scaffoldBackgroundColor,
          //         activeColor: Colors.orange,
          //         inactiveThumbColor: Colors.orange,

          //         onChanged: (bool value) {
          //           setState(() {
          //             showamount = value;
          //           });
          //         },
          //       )
          //     ],
          //   ),
          // ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromARGB(255, 235, 233, 233),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.md_home_outline,
                          color: Colors.orange,
                          size: 15,
                        ),
                        SizedBox(width: 15),
                        Text(
                          "About Business",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: black,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromARGB(255, 235, 233, 233),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.person_outline,
                          color: Colors.orange,
                          size: 15,
                        ),
                        SizedBox(width: 15),
                        Text(
                          "view Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: black,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromARGB(255, 235, 233, 233),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.document_outline,
                          color: Colors.orange,
                          size: 15,
                        ),
                        SizedBox(width: 15),
                        Text(
                          "Terms And Condition",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: black,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    // onTap: () => logout(),
                    onTap: () => showAlertDialog(context),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromARGB(255, 235, 233, 233),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Ionicons.log_out_outline,
                            color: Colors.orange,
                            size: 15,
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Logout",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: white,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
