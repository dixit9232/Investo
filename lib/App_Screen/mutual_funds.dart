import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investo/App_Screen/holdings.dart';
import 'package:investo/App_Screen/stock_mutual_List.dart';
import 'package:page_transition/page_transition.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Mutual_Fund extends StatefulWidget {
  const Mutual_Fund({super.key});

  @override
  State<Mutual_Fund> createState() => _Mutual_FundState();
}

class _Mutual_FundState extends State<Mutual_Fund> {
  @override
  List<data> stock_data = [
    data(80.5, 9.15),
    data(100.8, 9.30),
    data(70.56, 9.45),
    data(75.80, 10.00),
    data(90.60, 10.15),
    data(50.90, 10.30),
    data(100.70, 10.45),
    data(150.5, 11.00),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: SingleChildScrollView(keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: AnimationLimiter(
          child: Column(
              children: AnimationConfiguration.toStaggeredList(
            childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: 30,
                verticalOffset: 80, duration: Duration(milliseconds: 500),
                child: FadeInAnimation(child: widget)),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Your Investment",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 25, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white10),
                            shape: MaterialStatePropertyAll(StadiumBorder())),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            "Verify Holdings",
                            style: TextStyle(
                                fontSize: 15, color: Colors.indigo.shade200),
                          ),
                        )),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                    color: Color(0xffA6A5EF),
                    borderRadius: BorderRadius.circular(25)),
                child: Column(children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Invested",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        "\tCurrent",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        "\tTotal Returns",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "\$12,714.24",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        "\$13,201.20",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        "+\$1023.74",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              "import funds",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.tealAccent),
                            ),
                          ),
                        ],
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(
                            Icons.pie_chart,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              "Portfolio Analysis",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.tealAccent),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Stocks",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white10),
                          shape: MaterialStatePropertyAll(StadiumBorder())),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Row(
                          children: [
                            Text(
                              "Filter",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.indigo.shade200),
                            ),
                            Icon(
                              Icons.filter_list,
                              size: 15,
                              color: Colors.indigo.shade200,
                            )
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: Stock.mutual_funds.length,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: SlideAnimation(
                        verticalOffset: 50,
                        duration: Duration(milliseconds: 500),
                        child: FadeInAnimation(
                          child: Card(
                              color: Colors.white30,
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(duration: Duration(milliseconds: 500),
                                          child: Holdings(index),
                                          type: PageTransitionType.fade));
                                },
                                contentPadding: EdgeInsets.all(10),
                                leading: CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Colors.white,
                                  child: Image.asset(
                                      "${Stock.mutual_fund_image[index]}",
                                      height: 50,
                                      width: 40),
                                ),
                                titleAlignment: ListTileTitleAlignment.center,
                                title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          textAlign: TextAlign.start,
                                          "${Stock.mutual_funds[index]}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 80,
                                          width: 74,
                                          child: SfCartesianChart(
                                            plotAreaBorderWidth: 0,
                                            primaryXAxis: CategoryAxis(
                                              majorTickLines:
                                                  MajorTickLines(width: 0),
                                              labelsExtent: 0,
                                              axisLine: AxisLine(width: 0),
                                              majorGridLines:
                                                  MajorGridLines(width: 0),
                                            ),
                                            primaryYAxis: CategoryAxis(
                                                majorTickLines:
                                                    MajorTickLines(width: 0),
                                                labelsExtent: 0,
                                                axisLine: AxisLine(width: 0),
                                                majorGridLines:
                                                    MajorGridLines(width: 0)),
                                            series: <ChartSeries<data, double>>[
                                              LineSeries<data, double>(
                                                  color: Colors.green,
                                                  dataSource: stock_data,
                                                  xValueMapper: (data d, _) =>
                                                      d.time,
                                                  yValueMapper: (data d, _) =>
                                                      d.price,
                                                  dataLabelSettings:
                                                      DataLabelSettings(
                                                          isVisible: false)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                trailing: Column(children: [
                                  Text(
                                    "\$${Stock.Stock_price[index]}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 20, color: Colors.green),
                                  ),
                                  Text(
                                    "${Stock.Stock_price_movement[index]}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: Colors.green, fontSize: 18),
                                  )
                                ]),
                              )),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )),
        ),
      )),
    );
  }
}

class data {
  data(this.price, this.time);

  double price;
  double time;
}
