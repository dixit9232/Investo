import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:investo/App_Screen/Deshboard.dart';
import 'package:investo/App_Screen/news_list.dart';
import 'package:investo/App_Screen/portfolio.dart';
import 'package:investo/App_Screen/user_page.dart';
import 'package:investo/main.dart';

class Screen_1 extends StatefulWidget {
  int? index;

  Screen_1([this.index]);

  static bool stock = false;

  @override
  State<Screen_1> createState() => _Screen_1State();
}

class _Screen_1State extends State<Screen_1> {
  int page = 0;
  List screen = [DeshBoard(), Portfolio(), News(), User_Page()];
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  var image;
  File? file;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (OnBordingScreen.prefs!.getString("path") != null) {
      image = OnBordingScreen.prefs!.getString("path");
      file = File(image);
    }
    if (widget.index != null) {
      page = widget.index!;
    }
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: screen[page],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          items: [
            Icon(
              Icons.home,
              color: Colors.white,
              size: 40,
            ),
            Icon(
              Icons.business_center_rounded,
              color: Colors.white,
              size: 40,
            ),
            Icon(
              Icons.newspaper_rounded,
              color: Colors.white,
              size: 40,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: FileImage(file!), fit: BoxFit.fill)),
              // child: Image.file(file!,fit: BoxFit.fill),
            )
          ],
          backgroundColor: Theme.of(context).primaryColor,
          index: page,
          height: 60,
          color: Colors.white30,
          animationDuration: Duration(milliseconds: 300),
          animationCurve: Curves.easeInCirc,
          onTap: (value) {
            page = value;
            setState(() {
              if (page == 0) {
                Screen_1();
              }
              if (page == 1) {
                Portfolio();
              }
              if (page == 2) {
                News();
              }
              if (page == 3) {
                User_Page();
              }
            });
          },
          letIndexChange: (value) => true,
        ),
      ),
    );
  }
}
