import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:investo/App_Screen/Chart_page.dart';
import 'package:investo/App_Screen/screen_1.dart';
import 'package:investo/App_Screen/stock_mutual_List.dart';
import 'package:page_transition/page_transition.dart';

import 'holdings.dart';

class Sell_Mutual_Fund extends StatefulWidget {
  int index;

  Sell_Mutual_Fund(this.index);

  @override
  State<Sell_Mutual_Fund> createState() => _Sell_Mutual_FundState();
}

class _Sell_Mutual_FundState extends State<Sell_Mutual_Fund> {
  @override
  bool order_type = false;
  TextEditingController qty_controller = TextEditingController();
  TextEditingController price_controller = TextEditingController();
  TextEditingController price_controller1 = TextEditingController();
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: IconButton(
                      splashRadius: 0.1,
                      onPressed: () {
                        (Screen_1.stock==true)?Navigator.pushReplacement(
                            context,
                            PageTransition(duration: Duration(milliseconds: 500),
                                child: Holdings(widget.index),
                                type: PageTransitionType.fade)):Navigator.pushReplacement(
                            context,
                            PageTransition(duration: Duration(
                                milliseconds: 500),
                                child: Chart(widget.index),
                                type: PageTransitionType.fade));;
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      )),
                ),(Screen_1.stock==false)?Text(
                  "Sell ${Stock.Stock_name[widget.index]}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 20),
                ):
                Text(
                  "Sell ${Stock.mutual_funds[widget.index]}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 20),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white12,
                  radius: 25,
                  child: IconButton(
                      splashRadius: 0.1,
                      onPressed: () {},
                      icon: Icon(
                        Icons.bookmark,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white12,
                    radius: 25,
                    child: IconButton(
                        splashRadius: 0.1,
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Order Type",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(width: 50),
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(130, 50)),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                          backgroundColor: (order_type == false)
                              ? MaterialStatePropertyAll(Color(0xffA6A5EF))
                              : MaterialStatePropertyAll(Colors.transparent)),
                      onPressed: () {
                        setState(() {
                          order_type = false;
                        });
                      },
                      child: Text("Limit",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 22, fontWeight: FontWeight.normal))),
                ),
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(130, 50)),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                          backgroundColor: (order_type)
                              ? MaterialStatePropertyAll(Color(0xffA6A5EF))
                              : MaterialStatePropertyAll(Colors.transparent)),
                      onPressed: () {
                        setState(() {
                          order_type = true;
                        });
                      },
                      child: Text("Market",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 22, fontWeight: FontWeight.normal))),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Qty",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white30),
                    child: TextField(controller: qty_controller,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 25),
                      decoration: InputDecoration(
                          hintText: "Enter Qty.",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 20, color: Colors.white54),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Price",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white30),
                    child: TextField(controller: (order_type==false)?price_controller:price_controller1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      enabled: (order_type == false) ? true : false,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 25),
                      decoration: InputDecoration(
                          hintText: (order_type == false)
                              ? "Set a Price"
                              : "At Market Price",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 20, color: Colors.white54),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0xffA6A5EF)),
                                    fixedSize:
                                        MaterialStatePropertyAll(Size(0.0, 50)),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)))),
                                onPressed: () {
                                  if (order_type == false) {
                                    if (qty_controller.text != "" &&
                                        price_controller != "") {
                                      showDialog(barrierDismissible:false,
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor:
                                            Theme
                                                .of(context)
                                                .primaryColor,
                                            content: SizedBox(
                                              height: 300,
                                              width: 300,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Container(
                                                        height: 100,
                                                        width: 100,
                                                        child: Image.asset(
                                                            fit: BoxFit
                                                                .fill,
                                                            "assets/Images/icon success.png"),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Text(
                                                        "Order Confirmed",
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .displayLarge!
                                                            .copyWith(
                                                            fontSize: 35,
                                                            color: Colors
                                                                .tealAccent),
                                                      )
                                                    ],
                                                  ),
                                                  Text(
                                                    textAlign: TextAlign
                                                        .center,
                                                    "Your Order has been confirmed,You can check directly in to the order history",
                                                    style: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .titleSmall,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .all(8.0),
                                                          child: ElevatedButton(
                                                              style: ButtonStyle(
                                                                  fixedSize:
                                                                  MaterialStatePropertyAll(
                                                                      Size(
                                                                          0.1,
                                                                          50)),
                                                                  backgroundColor:
                                                                  MaterialStatePropertyAll(
                                                                      Color(
                                                                          0xffA6A5EF))),
                                                              onPressed: () {
                                                                Navigator
                                                                    .pushReplacement(
                                                                    context,
                                                                    PageTransition(
                                                                        child: Screen_1(),duration: Duration(milliseconds: 500),
                                                                        type: PageTransitionType.fade));
                                                              },
                                                              child: Text(
                                                                "Next",
                                                                style: Theme
                                                                    .of(
                                                                    context)
                                                                    .textTheme
                                                                    .titleMedium!
                                                                    .copyWith(
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                              )),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Fill Qty and Price Field");
                                    }
                                  } else {
                                    if (qty_controller != "") {
                                      showDialog(barrierDismissible:false,
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor:
                                            Theme
                                                .of(context)
                                                .primaryColor,
                                            content: SizedBox(
                                              height: 300,
                                              width: 300,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Container(
                                                        height: 100,
                                                        width: 100,
                                                        child: Image.asset(
                                                            fit: BoxFit
                                                                .fill,
                                                            "assets/Images/icon success.png"),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Text(
                                                        "Order Confirmed",
                                                        style: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .displayLarge!
                                                            .copyWith(
                                                            fontSize: 35,
                                                            color: Colors
                                                                .tealAccent),
                                                      )
                                                    ],
                                                  ),
                                                  Text(
                                                    textAlign: TextAlign
                                                        .center,
                                                    "Your Order has been confirmed,You can check directly in to the order history",
                                                    style: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .titleSmall,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .all(8.0),
                                                          child: ElevatedButton(
                                                              style: ButtonStyle(
                                                                  fixedSize:
                                                                  MaterialStatePropertyAll(
                                                                      Size(
                                                                          0.1,
                                                                          50)),
                                                                  backgroundColor:
                                                                  MaterialStatePropertyAll(
                                                                      Color(
                                                                          0xffA6A5EF))),
                                                              onPressed: () {
                                                                Navigator
                                                                    .pushReplacement(
                                                                    context,
                                                                    PageTransition(
                                                                        child: Screen_1(),duration: Duration(milliseconds: 500),
                                                                        type: PageTransitionType.fade));
                                                              },
                                                              child: Text(
                                                                "Next",
                                                                style: Theme
                                                                    .of(
                                                                    context)
                                                                    .textTheme
                                                                    .titleMedium!
                                                                    .copyWith(
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                              )),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                    else{
                                      Fluttertoast.showToast(
                                          msg: "Fill Qty Field");
                                    }
                                  }
                                },
                                child: Text(
                                  "Sell",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontSize: 25),
                                )),
                          ),
                        ),
                      ],
                    )))
          ],
        )),
      ),
    );
  }
}
