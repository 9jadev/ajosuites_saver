import 'package:ajosuite_saver/style.dart';
import 'package:ajosuite_saver/utilities/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:ajosuite_saver/services/backend.dart';

class MoreTransactions extends StatefulWidget {
  const MoreTransactions({Key? key}) : super(key: key);

  @override
  State<MoreTransactions> createState() => _MoreTransactionsState();
}

class _MoreTransactionsState extends State<MoreTransactions> {
  Backend backend = Backend();
  String? selectype = null;
  bool loading = true;
  bool loadingmore = false;
  String? next_page_url;
  List? transactions;
  Map<String?, dynamic>? data = {
    "type": null,
    "per_page": 10,
  };

  loadit() async {
    setState(() {
      data!["type"] = selectype;
    });
    await backend.moretransactions(data: data!).then((value) {
      // print(value);
      if (value["status"] == "success") {
        setState(() {
          transactions = value["transactions"]["data"];
          loading = false;
          next_page_url = value["transactions"]["next_page_url"];
        });
      }
    });
  }

  loadmore() async {
    setState(() {
      loadingmore = true;
    });
    await backend.paginator(data: data!, url: next_page_url!).then((value) {
      if (value["status"] == "success") {
        setState(() {
          transactions!.addAll(value["transactions"]["data"]);
          loading = false;
          loadingmore = false;
          next_page_url = value["transactions"]["next_page_url"];
        });
      }
    });
  }

  @override
  void initState() {
    loadit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        title: Text("Transactions"),
        actions: [
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
              itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: Text("All"),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text("Savings"),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Text("Withdrawals"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              // print("My account menu is selected.");
              setState(() {
                selectype = null;
                loading = true;
                transactions = null;
                next_page_url = null;
                loadingmore = false;
              });
              loadit();
            } else if (value == 1) {
              // print("Settings menu is selected.");
              setState(() {
                selectype = "savings";
                loading = true;
                transactions = null;
                next_page_url = null;
                loadingmore = false;
              });
              loadit();
            } else if (value == 2) {
              // print("Logout menu is selected.");
              setState(() {
                selectype = "withdrawal";
                loading = true;
                transactions = null;
                next_page_url = null;
                loadingmore = false;
              });
              loadit();
            }
          }),
        ],
      ),
      body: loading
          ? Center(
              child: CupertinoActivityIndicator(
                animating: true,
                color: primary,
                radius: 15,
              ),
            )
          : ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Visibility(
                      visible: transactions!.isNotEmpty,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10,
                        ),
                        child: Column(
                          children: transactions!
                              .map(
                                (item) => Container(
                                  // height: 50,
                                  width: 100.w,
                                  margin: EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: savingcard.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: primary.withOpacity(0.5),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        // alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: white,
                                        ),
                                        child: Icon(
                                          item["type"] == "savings"
                                              ? FontAwesome5Regular
                                                  .money_bill_alt
                                              : Ionicons.stats_chart,
                                          color: item["type"] == "savings"
                                              ? primary
                                              : success,
                                          size: 10,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Visibility(
                                            visible: item["type"] == "savings",
                                            child: Text(
                                              "Saving: " +
                                                  item["savings_serial"]
                                                      .toString(),
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: item["type"] != "savings",
                                            child: Text(
                                              "Withdrawal Id: " +
                                                  item["withdrawal_id"]
                                                      .toString(),
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            stringamount(item["amount"]),
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                          Text(
                                            dateformater(item["created_at"]),
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: next_page_url != null && loadingmore == false,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextButton(
                            onPressed: () => loadmore(),
                            child: Text(
                              "Load More",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: next_page_url != null && loadingmore == true,
                      child: Center(
                        child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CupertinoActivityIndicator(
                                    animating: true,
                                    color: primary,
                                    radius: 10,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Loading",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: primary,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
