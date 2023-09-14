import 'package:flutter/material.dart';
import 'package:investo/App_Screen/news_page.dart';
import 'package:investo/App_Screen/stock_mutual_List.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white12,
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    cursorHeight: 25,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 20, color: Colors.white38),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: "\tSearch...",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 20, color: Colors.white38),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CircleAvatar(
                backgroundColor: Colors.white12,
                radius: 25,
                child: IconButton(
                    splashRadius: 0.1,
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Images/Group 3723.png"),
                      fit: BoxFit.fill)),
            ),
          ),
          Expanded(
            child: ListView.builder(itemCount: Stock.stock_image.length+Stock.mutual_fund_image.length,
              itemBuilder: (context, index) {
                return InkWell(onTap: () {
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                     return News_page(index);
                   },));
                },
                  child: Container(
                    height: 150,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset("assets/Images/Image Copy 5.png",
                              height: 100, width: 100),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                                    softWrap: true,
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 16),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      "Dec 14 2017 2:30 PM",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(14.0),
                                    child: Text("By XYZ",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.blue)),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
