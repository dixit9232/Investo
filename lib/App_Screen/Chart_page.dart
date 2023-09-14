import 'package:flutter/material.dart';
import 'package:investo/App_Screen/buy_mutual_fund.dart';
import 'package:investo/App_Screen/screen_1.dart';
import 'package:investo/App_Screen/sell_mutual_fund.dart';
import 'package:investo/App_Screen/stock_mutual_List.dart';
import 'package:page_transition/page_transition.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  int index;

  Chart(this.index);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  List<data> stock_data = [
    data(60.5, 9.15),
    data(70.8, 9.30),
    data(65.56, 9.45),
    data(80.80, 10.00),
    data(85.60, 10.15),
    data(90.90, 10.30),
    data(80.70, 10.45),
    data(100.70, 11.00),
    data(120.70, 11.15),
    data(130.70, 11.30),
    data(135.70, 11.45),
    data(140.5, 12.00),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
        child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: IconButton(
                              splashRadius: 0.1,
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(duration: Duration(milliseconds: 500),
                                        child: Screen_1(),
                                        type: PageTransitionType.fade));
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 190,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: CircleAvatar(
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
                        ),
                      ),
                      Expanded(
                        child: Padding(
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
                      ),
                    ],
                  ),
                  Container(
                    height: 240,
                    width: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: Image.asset(
                                        "${Stock.stock_image[widget.index]}",
                                        height: 40,
                                        width: 40),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "${Stock.Stock_name[widget.index]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(fontFamily: "one"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0, right: 10.0),
                              child: Column(
                                children: [
                                  Text("\$${Stock.Stock_price[widget.index]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(fontSize: 25)),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      "${Stock.Stock_price_movement[widget.index]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(color: Colors.green.shade500),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Last Open",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 15, color: Colors.white54),
                                  ),
                                  Text(
                                    "\$2025.25",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 20),
                                  ),
                                  Text(
                                    "Last Close",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 15, color: Colors.white54),
                                  ),
                                  Text(
                                    "\$2825.55",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 20),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Low",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 15, color: Colors.white54),
                                  ),
                                  Text(
                                    "\$2031.81",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 20),
                                  ),
                                  Text(
                                    "High",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 15, color: Colors.white54),
                                  ),
                                  Text(
                                    "\$2531.11",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 20),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Low 52W Range",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 15, color: Colors.white54),
                                  ),
                                  Text(
                                    "\$2200.20",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 20),
                                  ),
                                  Text(
                                    "High 52W Range",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 15, color: Colors.white54),
                                  ),
                                  Text(
                                    "\$2501.41",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 20),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 300,
                    child: Stack(
                      children: [
                        SfCartesianChart(
                          plotAreaBorderWidth: 0,
                          primaryXAxis: CategoryAxis(
                            majorGridLines: MajorGridLines(width: 0),
                          ),
                          primaryYAxis: CategoryAxis(
                              // majorTickLines: MajorTickLines(width: 0),
                              // labelsExtent: 0,
                              axisLine: AxisLine(width: 0),
                              majorGridLines: MajorGridLines(width: 0)),
                          series: <ChartSeries<data, double>>[
                            AreaSeries<data, double>(
                                borderWidth: 3,
                                borderColor: Colors.green.shade900,
                                dataSource: stock_data,
                                xValueMapper: (data d, _) => d.time,
                                yValueMapper: (data d, _) => d.price,
                                gradient: LinearGradient(colors: [
                                  Colors.green.shade300,
                                  Colors.green.shade400,
                                  Colors.green.shade200
                                ]),
                                dataLabelSettings: DataLabelSettings(isVisible: false)),
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(alignment: Alignment(0.9,0.8),
                              child: Container(decoration: BoxDecoration(color: Colors.black87,borderRadius: BorderRadius.circular(20)),
                                child: IconButton(splashRadius: 0.1,onPressed: () {

                                }, icon: Icon(Icons.zoom_out_map,color: Colors.white,size: 30,)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "About Company",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                              """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, velit quis tincidunt pulvinar, tortor felis congue erat, id feugiat libero ligula ac metus. Fusce euismod vehicula risus, sed tincidunt libero tincidunt ac. Etiam aliquet, elit vel vestibulum tincidunt, justo libero varius justo, eu vestibulum arcu justo a libero. Sed nec ipsum eget turpis interdum euismod. Cras eget nunc urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus ac justo elit. Integer rhoncus semper urna at scelerisque. Suspendisse eget enim vel elit vulputate ullamcorper.
In euismod elit eu orci laoreet, eget facilisis quam accumsan. Suspendisse potenti. Sed vitae quam non augue dapibus tincidunt. Fusce ut vehicula nulla. Sed ut hendrerit libero, eget ultricies elit. Aliquam erat volutpat. Nunc vel nisl nec ligula feugiat eleifend. Nam ut lectus nec turpis laoreet vulputate eu vel elit. Proin eget felis a odio consequat congue a non sem.
Pellentesque in lacus eu ex lobortis elementum. Morbi at eleifend dolor, vel facilisis purus. Nunc non ipsum ac erat lacinia posuere. Fusce consectetur semper purus, ac fermentum odio. Integer a nisi at odio congue aliquam. In eget massa in metus malesuada tempor. Proin auctor tincidunt elit, at sodales nunc consequat eu. Nulla facilisi. Vivamus ac justo eget justo tincidunt congue a quis velit. Sed a massa eget orci gravida malesuada.""",softWrap: true,style: Theme.of(context).textTheme.titleSmall,),
                        ),
                      )
                    ],
                  )
                ],
        ),
      ),
              ),
              Container(height: 80,
              color: Theme.of(context).primaryColor,
              child:Row(
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
                      child: Text("Buy",
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

class data {
  data(this.price, this.time);

  double price;
  double time;
}
