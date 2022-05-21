import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:ajosuite_saver/style.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      width: 100.w,
      // margin: EdgeInsets.all(10),
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
                "Hello Levi,",
                style: TextStyle(
                  fontSize: 18,
                  color: white,
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
                  fontWeight: FontWeight.w400
                ),
              ),
              Text(
                "today?",
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  color: textlabel,
                  overflow: TextOverflow.clip,
                  fontWeight: FontWeight.w400
                ),
              )
            ],
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 192, 240, 194),
              borderRadius: BorderRadius.circular(100)
            ),
          )
        ],
      ),
    );
  }
}