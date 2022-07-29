import 'package:ajosuite_saver/pages/dashboard/cirles.dart';
import 'package:ajosuite_saver/pages/dashboard/dashboard.dart';
import 'package:ajosuite_saver/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ajosuite_saver/controllers/dashboard/homecontroller.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'savings.dart';
import 'withdrawals.dart';
import 'package:upgrader/upgrader.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int? state = 0;
List? pages = [
  Dashboard(),
  Savings(),
  WithdrawalPage(),
  SavingCirle(),
];

class _HomePageState extends State<HomePage> {
  void _onItemTapped(int index) {
    setState(() {
      state = index;
    });
  }

  HomePageController hompage = Get.find<HomePageController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: pages!.elementAt(state!.toInt()),
      body: UpgradeAlert(
        child: pages!.elementAt(state!.toInt()),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: savingcard,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: state!,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Ionicons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome5Regular.money_bill_alt),
              label: 'Savings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.stats_chart),
              label: 'Withdrawals',
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.aperture),
              label: 'Circles',
            ),
          ],
        ),
      ),
    );
  }
}
