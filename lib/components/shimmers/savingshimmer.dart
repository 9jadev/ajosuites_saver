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
            highlightColor: shimerto,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: shimerto,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: shimerbase,
                highlightColor: shimerto,
                child: Container(
                  width: 200,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: shimerto,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Shimmer.fromColors(
                baseColor: shimerbase,
                highlightColor: shimerto,
                child: Container(
                  width: 60.w,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: shimerto,
                  ),
                ),
              ),
              SizedBox(height: 7),
              Shimmer.fromColors(
                baseColor: shimerbase,
                highlightColor: shimerto,
                child: Container(
                  width: 20.w,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: shimerto,
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