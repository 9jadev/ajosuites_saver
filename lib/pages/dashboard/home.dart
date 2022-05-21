import 'package:ajosuite_saver/components/header.dart';
import 'package:ajosuite_saver/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ajosuite_saver/components/shimmers/savingshimmer1.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _onItemTapped(int index) {
    if(index == 1) {
      Get.offAndToNamed('dashboard/saving');
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(100)
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Notifications",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: white
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Text(
                  "Active Savings",
                  style: kpagelabel,
                ),
                const SizedBox(height: 10),
                 
                Container(
                  height: 130,
                  width: 100.w,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // Text("dmk today?"),
                      Container(
                        margin: EdgeInsets.only(right: 7),
                        child: Card(
                          shadowColor: savingcard,
                          color: savingcard,
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
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
                                    Text("Daily Savings"),
                                    Text(
                                      "30 days intervals",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text("Amount "),
                                        Text(
                                          "N40,0000",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "SAV29CRUC939C93UU",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 15),
                                Row(
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
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: primary
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                     Savingshimming(),
                
                     Savingshimming(),
                     
                     Savingshimming(),
                     
                
                      
                    ],
                  ),
                ),
                
                
                const SizedBox(height: 20),
                Text(
                  "Withdrawn Savings",
                  style: kpagelabel,
                ),
                const SizedBox(height: 10),
                 
                Container(
                  height: 125,
                  width: 100.w,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // Text("dmk today?"),
                      // Container(
                      //   margin: EdgeInsets.only(right: 7),
                      //   child: Card(
                      //     shadowColor: savingcard,
                      //     color: savingcard,
                      //     child: Container(
                      //       height: 130,
                      //       width: 300,
                      //       padding: EdgeInsets.all(10),
                
                      //       decoration: BoxDecoration(
                      //         color: savingcard,
                      //         borderRadius: BorderRadius.circular(10), 
                      //       ),
                      //       child: Row(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Icon(
                      //             FontAwesome5Solid.money_bill_wave,
                      //             color: primary,
                      //           ),
                      //           SizedBox(width: 15),
                      //           Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text("Daily Savings"),
                      //               Text(
                      //                 "30 days intervals",
                      //                 style: TextStyle(
                      //                   fontWeight: FontWeight.w700
                      //                 ),
                      //               ),
                      //               Row(
                      //                 children: [
                      //                   Text("Amount "),
                      //                   Text(
                      //                     "N40,0000",
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.w700
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //               SizedBox(height: 10),
                      //               Text(
                      //                 "SAV29CRUC939C93UU",
                      //                 style: TextStyle(
                      //                   fontWeight: FontWeight.w700
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(width: 15),
                      //           Row(
                      //             crossAxisAlignment: CrossAxisAlignment.center,
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Icon(
                      //                 FontAwesome5Solid.star,
                      //                 color: primary,
                      //                 size: 15,
                      //               ),
                      //               const SizedBox(width: 5),
                      //               Text(
                      //                 "Active",
                      //                 style: TextStyle(
                      //                   fontSize: 15,
                      //                   color: primary
                      //                 ),
                      //               )
                      //             ],
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                     Savingshimming(),
                
                     Savingshimming(),
                     
                     Savingshimming(),
                     
                
                      
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                
                Text(
                  "BLocked Savings",
                  style: kpagelabel,
                ),
                const SizedBox(height: 10),
                 
                Container(
                  height: 125,
                  width: 100.w,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // Text("dmk today?"),
                      // Container(
                      //   margin: EdgeInsets.only(right: 7),
                      //   child: Card(
                      //     shadowColor: savingcard,
                      //     color: savingcard,
                      //     child: Container(
                      //       height: 130,
                      //       width: 300,
                      //       padding: EdgeInsets.all(10),
                
                      //       decoration: BoxDecoration(
                      //         color: savingcard,
                      //         borderRadius: BorderRadius.circular(10), 
                      //       ),
                      //       child: Row(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Icon(
                      //             FontAwesome5Solid.money_bill_wave,
                      //             color: primary,
                      //           ),
                      //           SizedBox(width: 15),
                      //           Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text("Daily Savings"),
                      //               Text(
                      //                 "30 days intervals",
                      //                 style: TextStyle(
                      //                   fontWeight: FontWeight.w700
                      //                 ),
                      //               ),
                      //               Row(
                      //                 children: [
                      //                   Text("Amount "),
                      //                   Text(
                      //                     "N40,0000",
                      //                     style: TextStyle(
                      //                       fontWeight: FontWeight.w700
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //               SizedBox(height: 10),
                      //               Text(
                      //                 "SAV29CRUC939C93UU",
                      //                 style: TextStyle(
                      //                   fontWeight: FontWeight.w700
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(width: 15),
                      //           Row(
                      //             crossAxisAlignment: CrossAxisAlignment.center,
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Icon(
                      //                 FontAwesome5Solid.star,
                      //                 color: primary,
                      //                 size: 15,
                      //               ),
                      //               const SizedBox(width: 5),
                      //               Text(
                      //                 "Active",
                      //                 style: TextStyle(
                      //                   fontSize: 15,
                      //                   color: primary
                      //                 ),
                      //               )
                      //             ],
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                     Savingshimming(),
                
                     Savingshimming(),
                     
                     Savingshimming(),
                     
                
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.shifting,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesome.home),
            label: 'Savings',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5Regular.money_bill_alt),
            label: 'Withdrawals',
          ),
        ],
      ),
    );  
  }
}