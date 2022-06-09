import 'package:ajosuite_saver/utilities/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:ajosuite_saver/style.dart';

class SavingsCard extends StatelessWidget {
  final dynamic savingdata;
  const SavingsCard({
    Key? key,
    @required this.savingdata,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              FontAwesome5Solid.money_bill_wave,
              color: primary,
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${savingdata["savings_type"].toString()} Savings"),
                SizedBox(height: 10),
                Text(
                  "${savingdata["saving_interval"].toString()} intervals",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    // Text("Amount "),
                    Text(
                      stringamount(savingdata["saving_amount"].toString()),
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                // SizedBox(height: ),
                Text(
                  "${savingdata["savings_serial"].toString()}",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(width: 15),
            Visibility(
              visible: savingdata["status"].toString() == '0',
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesome5Solid.star,
                    color: primary,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Active",
                    style: TextStyle(fontSize: 15, color: primary),
                  )
                ],
              ),
            ),
            Visibility(
              visible: savingdata["status"].toString() == '1',
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesome5Solid.star,
                    color: success,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Completed",
                    style: TextStyle(fontSize: 15, color: success),
                  )
                ],
              ),
            ),
            Visibility(
              visible: savingdata["status"].toString() == '2',
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesome5Solid.star,
                    color: error,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Blocked",
                    style: TextStyle(fontSize: 15, color: error),
                  )
                ],
              ),
            ),
            Visibility(
              visible: savingdata["status"].toString() == '3',
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesome5Solid.star,
                    color: success,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Withdrawn",
                    style: TextStyle(fontSize: 15, color: success),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
