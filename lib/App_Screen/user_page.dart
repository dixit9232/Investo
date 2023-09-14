import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investo/main.dart';
import 'package:investo/user_info/Login_page.dart';
import 'package:page_transition/page_transition.dart';

class User_Page extends StatefulWidget {
  const User_Page({super.key});

  @override
  State<User_Page> createState() => _User_PageState();
}

class _User_PageState extends State<User_Page> {
  File? file;
  var image;

  void initState() {
    // TODO: implement initState
    super.initState();
    image = OnBordingScreen.prefs!.getString("path");
    file = File(image);
  }

  List item = [
    FaIcon(FontAwesomeIcons.gift, color: Colors.white, size: 30,),
    FaIcon(FontAwesomeIcons.wallet, color: Colors.white, size: 30,),
    FaIcon(FontAwesomeIcons.newspaper, color: Colors.white, size: 30,),
    FaIcon(FontAwesomeIcons.bank, color: Colors.white, size: 30,),
    Icon(Icons.support_agent, color: Colors.white, size: 30,),
    Icon(Icons.report, color: Colors.white, size: 30,),
    Icon(Icons.logout, color: Colors.white, size: 30,),
  ];
  List text = [
    Text("Refer"),
    Text("\$2025.80"),
    Text("All Order"),
    Text("Bank details"),
    Text("Customer support 24x7"),
    Text("Reports"),
    Text("Logout"),
  ];
  List sub_text = [
    Text("Invite Friends on Investo",
        style: TextStyle(color: Colors.white, fontFamily: "two")),
    Text("Stocks, F&O balance",
        style: TextStyle(color: Colors.white, fontFamily: "two")),
    Text("Track orders, order details",
        style: TextStyle(color: Colors.white, fontFamily: "two")),
    Text("Banks & Autopay mandetes",
        style: TextStyle(color: Colors.white, fontFamily: "two")),
    Text("FAQs,Contect Investo",
        style: TextStyle(color: Colors.white, fontFamily: "two")),
    Text("Stocks & mutual funds reports",
        style: TextStyle(color: Colors.white, fontFamily: "two")),
    Text("  ", style: TextStyle(color: Colors.white, fontFamily: "two")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: FileImage(file!), fit: BoxFit.fill)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "${OnBordingScreen.prefs!.getString("name")}",
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleMedium,
                        ),
                        Text("Account Details", style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall,)
                      ],
                    ),
                  ),

                  Expanded(child: Icon(
                    Icons.arrow_forward_ios, size: 30, color: Colors.white,))
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ListView.builder(itemCount: item.length,dragStartBehavior:DragStartBehavior.start,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(onTap: () {
                          if (index == 6) {
                            OnBordingScreen.prefs!.setBool("is_login", false);
                            Navigator.pushAndRemoveUntil(context,
                                PageTransition(child: Login(),duration: Duration(milliseconds: 500),
                                    type: PageTransitionType.fade), (
                                    route) => true);
                          }
                        },
                          child: ListTile(
                              leading: CircleAvatar(radius: 25,
                                child: item[index],
                                backgroundColor: Colors.white30,),
                              title: text[index], titleTextStyle: Theme
                              .of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 20),
                              subtitle: sub_text[index]
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
