import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:investo/App_Screen/buy_mutual_fund.dart';
import 'package:investo/App_Screen/screen_1.dart';
import 'package:investo/App_Screen/sell_mutual_fund.dart';
import 'package:investo/App_Screen/stock_mutual_List.dart';
import 'package:page_transition/page_transition.dart';

class Holdings extends StatefulWidget {
  int index;

  Holdings(this.index);

  @override
  State<Holdings> createState() => _HoldingsState();
}

class _HoldingsState extends State<Holdings> {
  List time = [
    "13 Apr 2021",
    "9 Apr 2021",
    "6 Apr 2021",
    "2 Apr 2021",
    "29 march 2021",
    "25 march 2021",
  ];
  List avrage_price = [
    "225.25",
    "220.75",
    "231.80",
    "228.95",
    "221.80",
    "229.60"
  ];

  List invested_price = [
    "2202.25",
    "2580.35",
    "2385.64",
    "2790.25",
    "2100.80",
    "2605.66"
  ];
  List share_lot = ["9", "12", "3", "5", "2", "8"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: IconButton(
                    splashRadius: 0.1,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: Screen_1(),duration: Duration(milliseconds: 500),
                              type: PageTransitionType.fade));
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
              Text(
                "Holdings Details",
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Neumorphic(
                style: NeumorphicStyle(
                    color: Theme.of(context).primaryColor,
                    shadowDarkColor: Colors.deepPurple.shade900,
                    depth: 10,
                    shadowLightColor: Colors.deepPurple.shade100,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(30))),
                child: Container(
                  height: 280,
                  width: 370,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(flex: 1,
                            child: Container(
                              color: Colors.deepPurple.shade200,
                              height: 60,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 100),
                                    child: Text(
                                      "${Stock.mutual_funds[widget.index]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ),
                                  SizedBox(width: 40),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Row(
                                      children: [
                                        Text("23",
                                            style: TextStyle(
                                                color: Colors.deepPurple.shade900,
                                                fontSize: 20,
                                                fontFamily: "one",
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Shares",softWrap: true,
                                      style:
                                          Theme.of(context).textTheme.titleSmall,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Current Value",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.white54),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "\$3022.02",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Total Invested",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.white54),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "\$2022.02",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Market Price",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.white54),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "\$522.02",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Average Price",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.white54),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "\$520.11",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "1 Day Returns",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.white54),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "+\$35.25 (0.03%)",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Total Returns",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.white54),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "+\$125.25 (0.23%)",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Transactions",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Share (Invested)",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 20, color: Colors.white38),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: time.length,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 100,
                  child: Card(
                    color: Colors.white38,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "${time[index]}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.normal, fontSize: 20),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "\$${avrage_price[index]}",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.white70),
                        ),
                      ),
                      trailing: Column(children: [
                        RichText(
                            text: TextSpan(
                                text: "${share_lot[index]}",
                                style: TextStyle(
                                    color: Colors.tealAccent,
                                    fontSize: 20,
                                    fontFamily: "one"),
                                children: [
                              TextSpan(
                                  text: " Share",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white54))
                            ])),
                        Expanded(
                          child: Text(
                            "(\$${invested_price[index]})",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 25),
                          ),
                        )
                      ]),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(170, 50)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xffA6A5EF)),
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white12)),
                    // : MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(duration: Duration(milliseconds: 500),
                              child: Sell_Mutual_Fund(widget.index),
                              type: PageTransitionType.fade));
                    },
                    child: Text("Sell",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 22, fontWeight: FontWeight.normal))),
                ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(170, 50)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xffA6A5EF))),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(duration: Duration(milliseconds: 500),
                              child: Buy_Mutual_Fund(widget.index),
                              type: PageTransitionType.fade));
                    },
                    child: Text("Buy More",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 22, fontWeight: FontWeight.normal)))
              ],
            ),
          )
        ],
      )),
    );
  }
}
