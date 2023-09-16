import 'package:flutter/material.dart';
import 'package:investo/App_Screen/stock_mutual_List.dart';
import 'package:investo/main.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Welcome!!",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 25),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "${OnBordingScreen.prefs!.getString("name")}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  alignment: Alignment.center,
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Colors.deepPurple.shade300,
                            Colors.deepPurple.shade200,
                            Colors.deepPurple.shade100,
                          ]),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total Portfolio Value",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 20),
                        ),
                        SizedBox(
                          height: 15.5,
                        ),
                        Text(
                          "\$ 4,409.98",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 40),
                        ),
                        SizedBox(
                          height: 15.5,
                        ),
                        Text(
                          "+ \$342.87 last month",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 22),
                        )
                      ]),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Recent Transaction",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 24),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: Stock.stock_image.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(20),
                        leading: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              "${Stock.stock_image[index]}",
                              height: 40,
                              width: 40,
                            )),
                        title: Text("${Stock.Stock_name[index]}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 20)),
                        subtitle: Text("Share",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: Colors.white54)),
                        trailing: Column(
                          children: [
                            Expanded(
                                child: Text(
                              "\$1250.00",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "one"),
                            )),
                            Text(
                              "01 March 2021",
                              style: TextStyle(
                              color: Colors.white54,
                              fontSize: 15,
                              fontFamily: "one"),
                            ),
                            Expanded(
                                child: Text(
                              "Successful",
                              style: TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 20,
                                  fontFamily: "one"),
                            )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
