import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ajosuite_saver/style.dart';

class Savingshimming extends StatelessWidget {
  const Savingshimming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 300,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 0, right: 10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: shimerbase,
            highlightColor: shimerto,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: shimerto,
              ),
            ),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: shimerbase,
                highlightColor: shimerto,
                child: Container(
                  width: 80,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: shimerto,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Shimmer.fromColors(
                baseColor: shimerbase,
                highlightColor: shimerto,
                child: Container(
                  width: 140,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: shimerto,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Shimmer.fromColors(
                baseColor: shimerbase,
                highlightColor: shimerto,
                child: Container(
                  width: 170,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: shimerto,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Shimmer.fromColors(
                baseColor: shimerbase,
                highlightColor: shimerto,
                child: Container(
                  width: 110,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: shimerto,
                  ),
                ),
              ),
              const SizedBox(height: 25),
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
            ],
          ),
        ],
      ),
    );
  }
}
