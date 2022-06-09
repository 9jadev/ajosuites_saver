import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:ajosuite_saver/style.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Header extends StatelessWidget {
  final dynamic userdata;
  const Header({
    Key? key,
    @required this.userdata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      width: 100.w,
      margin: EdgeInsets.only(top: 25),
      // padding: EdgeInsets.all(10),
      // color: primary,
      decoration: BoxDecoration(
          // border: Border(
          //   bottom: BorderSide(
          //     color: Colors.grey.shade600
          //   )
          // )
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello ${userdata["name"]},',
                style: TextStyle(
                  fontSize: 12,
                  color: black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "What service would you like",
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  color: textlabel,
                  overflow: TextOverflow.clip,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "today?",
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  color: textlabel,
                  overflow: TextOverflow.clip,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () => Get.toNamed("dashboard/profile"),
            child: CachedNetworkImage(
              imageUrl: userdata["logo"].toString(),
              // imageUrl: "https://avatars1.githubusercontent.com/u/45692276?v=4",
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
                  CircularProgressIndicator(value: downloadProgress.progress),
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
        ],
      ),
    );
  }
}
