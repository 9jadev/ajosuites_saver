import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ajosuite_saver/style.dart';
import 'package:sizer/sizer.dart';

class Savingshimmer extends StatelessWidget {
  const Savingshimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: shimerbase,
            highlightColor: white,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: shimerbase,
                highlightColor: white,
                child: Container(
                  width: 200,
                  height: 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: white,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Shimmer.fromColors(
                baseColor: shimerbase,
                highlightColor: white,
                child: Container(
                  width: 70.w,
                  height: 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: white,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Shimmer.fromColors(
                baseColor: shimerbase,
                highlightColor: white,
                child: Container(
                  width: 40.w,
                  height: 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
