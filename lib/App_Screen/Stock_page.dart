import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:investo/App_Screen/Chart_page.dart';
import 'package:investo/App_Screen/stock_mutual_List.dart';
import 'package:page_transition/page_transition.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Stocks extends StatefulWidget {
  const Stocks({super.key});

  @override
  State<Stocks> createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
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
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: BouncingScrollPhysics(),
          child: AnimationLimiter(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: AnimationConfiguration.toStaggeredList(
                  childAnimationBuilder: (widget) =>
                      SlideAnimation(
                          verticalOffset: 80,
                          horizontalOffset: 30,
                          duration: Duration(milliseconds: 500),
                          child: FadeInAnimation(
                            child: widget,
                          )),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Your Holdings",
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                fontSize: 30,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStatePropertyAll(Colors.white10),
                                  shape: MaterialStatePropertyAll(
                                      StadiumBorder())),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(
                                  "Verify Holdings",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.indigo.shade200),
                                ),
                              )),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 170,
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
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white54),
                            ),
                            Text(
                              "\tCurrent",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white54),
                            ),
                            Text(
                              "\tTotal Returns",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white54),
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
                              "\$20,714.94",
                              style:
                              TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Text(
                              "\$19,691.20",
                              style:
                              TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Text(
                              "-\$1023.74",
                              style:
                              TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                        Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: Alignment(0.6, 0.5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Stack(
                                      children: [
                                        Neumorphic(
                                          style: NeumorphicStyle(
                                              depth: -10.8,
                                              shadowLightColor:
                                              Colors.indigo.shade900,
                                              shadowDarkColor:
                                              Colors.indigo.shade900,
                                              shadowLightColorEmboss:
                                              Colors.indigo.shade900,
                                              shadowDarkColorEmboss:
                                              Colors.indigo.shade900,
                                              color: Colors.indigo.shade500,
                                              shape: NeumorphicShape.convex,
                                              boxShape:
                                              NeumorphicBoxShape.stadium()),
                                          child: Container(
                                              alignment: Alignment.center,
                                              height: 40,
                                              width: 250,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text("1D Returns",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color:
                                                          Colors.white70)),
                                                  Text("\t-\$448(2.83%)",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.red))
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Top Gainers",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStatePropertyAll(Colors.white10),
                                  shape: MaterialStatePropertyAll(
                                      StadiumBorder())),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(
                                  "See All",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.indigo.shade200),
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: Stock.Stock_name.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(onTap: () {
                            Navigator.pushReplacement(context, PageTransition(
                                child: Chart(index),duration: Duration(milliseconds: 500),
                                type: PageTransitionType.fade));
                          },
                            child: AnimationConfiguration.staggeredList(
                              position: index,
                              duration: Duration(milliseconds: 300),
                              child: SlideAnimation(
                                horizontalOffset: 50,
                                child: FadeInAnimation(
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    // height: 300,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.white30,
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            CircleAvatar(
                                              radius: 28,
                                              backgroundColor: Colors.white,
                                              child: Image.asset(
                                                  "${Stock.stock_image[index]}",
                                                  height: 50,
                                                  width: 40),
                                            ),
                                            Text(
                                              "${Stock.Stock_name[index]}",
                                              style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(fontFamily: "one"),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                "\$${Stock.Stock_price[index]}",
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(fontSize: 27)),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${Stock
                                                  .Stock_price_movement[index]}",
                                              style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                  color: Colors
                                                      .green.shade500),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                width: 200,
                                                child: SfCartesianChart(
                                                  plotAreaBorderWidth: 0,
                                                  primaryXAxis: CategoryAxis(
                                                    majorTickLines:
                                                    MajorTickLines(
                                                        width: 0),
                                                    labelsExtent: 0,
                                                    axisLine:
                                                    AxisLine(width: 0),
                                                    majorGridLines:
                                                    MajorGridLines(
                                                        width: 0),
                                                  ),
                                                  primaryYAxis: CategoryAxis(
                                                      majorTickLines:
                                                      MajorTickLines(
                                                          width: 0),
                                                      labelsExtent: 0,
                                                      axisLine:
                                                      AxisLine(width: 0),
                                                      majorGridLines:
                                                      MajorGridLines(
                                                          width: 0)),
                                                  series: <ChartSeries<data,
                                                      double>>[
                                                    AreaSeries<data, double>(
                                                        borderWidth: 3,
                                                        borderColor: Colors
                                                            .green.shade900,
                                                        dataSource: stock_data,
                                                        xValueMapper:
                                                            (data d, _) =>
                                                        d.time,
                                                        yValueMapper:
                                                            (data d, _) =>
                                                        d.price,
                                                        gradient:
                                                        LinearGradient(
                                                            colors: [
                                                              Colors.green,
                                                              Colors.greenAccent
                                                                  .shade400
                                                            ]),
                                                        dataLabelSettings:
                                                        DataLabelSettings(
                                                            isVisible:
                                                            false)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Companies",
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleMedium,
                        ),
                        TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStatePropertyAll(Colors.white10),
                                shape:
                                MaterialStatePropertyAll(StadiumBorder())),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Row(
                                children: [
                                  Text(
                                    "Filter",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.indigo.shade200),
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
                      height: 400,
                      child: ListView.builder(
                        cacheExtent: 0.4,
                        itemCount: Stock.Stock_name.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: Duration(milliseconds: 300),
                            child: SlideAnimation(
                              verticalOffset: 50,
                              child: FlipAnimation(
                                child: InkWell(onTap: () {
                                  Navigator.pushReplacement(context,
                                      PageTransition(child: Chart(index),duration: Duration(milliseconds: 500),
                                          type: PageTransitionType.fade));
                                },
                                  child: ListTile(
                                    enabled: false,
                                    contentPadding: EdgeInsets.all(10),
                                    leading: CircleAvatar(
                                      radius: 28,
                                      backgroundColor: Colors.white,
                                      child: Image.asset(
                                          "${Stock.stock_image[index]}",
                                          height: 50,
                                          width: 40),
                                    ),
                                    titleAlignment: ListTileTitleAlignment
                                        .center,
                                    title: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.start,
                                            "${Stock.Stock_name[index]}",
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                fontSize: 20,
                                                fontWeight:
                                                FontWeight.normal),
                                          ),
                                          SizedBox(
                                            height: 80,
                                            width: 90,
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
                                              series: <
                                                  ChartSeries<data, double>>[
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
                                        ]),
                                    trailing: Column(children: [
                                      Text(
                                        "\$${Stock.Stock_price[index]}",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                            fontSize: 20,
                                            color: Colors.green),
                                      ),
                                      Text(
                                        "${Stock.Stock_price_movement[index]}",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                            color: Colors.green,
                                            fontSize: 18),
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class data {
  data(this.price, this.time);

  double price;
  double time;
}
