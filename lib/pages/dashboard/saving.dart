import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:ajosuite_saver/style.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ajosuite_saver/components/header.dart';

class SavingsPage extends StatefulWidget {
  const SavingsPage({Key? key}) : super(key: key);

  @override
  State<SavingsPage> createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage> {
  void _onItemTapped(int index) {
    if(index == 0) {
      Get.offAndToNamed('dashboard/home');
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              const SizedBox(height: 20),
              Text(
                "Withdrawals",
                style: kpagelabel,
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  // Text("dmk today?"),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: [

                      ]
                    )  
                  ),
                  Container(
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
                  ),
                  Container(
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
                  ),
                  Container(
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
                  ),

                  Container(
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
                  ),

                  Container(
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
                  )
                  

                  // Shimmer.fromColors(
                  //   baseColor: Colors.grey[300],
                  //   highlightColor: Colors.grey[100],
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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