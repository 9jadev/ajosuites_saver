import 'package:flutter/material.dart';
import 'package:ajosuite_saver/style.dart';

class Savingsnone extends StatelessWidget {
  const Savingsnone({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 7),
      child: Container(
        height: 150,
        width: 300,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: savingcard,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text("No Data"),
      ),
    );
  }
}
