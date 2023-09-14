import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:investo/OnBordingScreen/OnBordingScreen1.dart';
import 'package:investo/OnBordingScreen/OnBordingScreen2.dart';
import 'package:investo/OnBordingScreen/OnBordingScreen3.dart';
import 'package:investo/splash_screen.dart';
import 'package:investo/user_info/Login_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MaterialApp(
    home: Splash(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Color(0xff080823),
        textTheme: TextTheme(
            displayLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "one",
                letterSpacing: 2,
                fontSize: 60),
            titleSmall:
                TextStyle(color: Colors.white, fontFamily: "two", fontSize: 20),
            titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "one",
                fontSize: 30))),
  ));
}

class OnBordingScreen extends StatefulWidget {
  static SharedPreferences? prefs;
  static Map? mobile_number = Map();
  static bool is_login = false;
  static bool is_signup = false;

  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  PageController controller = PageController();
  bool islastpage = false;

  get_permission() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if(androidInfo.version.sdkInt>=33){
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.phone,
      Permission.camera,
      Permission.calendar,
      Permission.contacts,
      Permission.photos,
      Permission.sms,
      Permission.manageExternalStorage,
    ].request();
    }
    if(androidInfo.version.sdkInt<33)
      {
        Map<Permission, PermissionStatus> statuses = await [
          Permission.location,
          Permission.phone,
          Permission.camera,
          Permission.contacts,
          Permission.calendar,
          Permission.manageExternalStorage,
          Permission.sms,
          Permission.storage
        ].request();
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logininfo();
    get_permission();
  }

  logininfo() async {
    OnBordingScreen.prefs = await SharedPreferences.getInstance();
    OnBordingScreen.mobile_number = {
      "number": OnBordingScreen.prefs!.getString("phone_number")
    };
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Stack(
            children: [
              PageView(
                controller: controller,
                onPageChanged: (value) {
                  islastpage = (value == 2);
                  setState(() {});
                },
                children: [Intropage1(), Intropage2(), Intropage3()],
              ),
              Container(
                  alignment: Alignment(0.0, 0.80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      (islastpage)
                          ? SizedBox(
                              width: 70,
                            )
                          : TextButton(
                              onPressed: () {
                                controller.jumpToPage(2);
                              },
                              child: Text("SKIP",
                                  style:
                                      Theme.of(context).textTheme.titleSmall)),
                      SmoothPageIndicator(controller: controller, count: 3),
                      (islastpage)
                          ? TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        duration: Duration(seconds: 1),
                                        child: Login(),
                                        alignment: Alignment.center,
                                        type: PageTransitionType.fade));
                              },
                              child: Text("LOGIN",
                                  style:
                                      Theme.of(context).textTheme.titleSmall))
                          : TextButton(
                              onPressed: () {
                                controller.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.decelerate);
                              },
                              child: Text("NEXT",
                                  style:
                                      Theme.of(context).textTheme.titleSmall)),
                    ],
                  )),
            ],
          ),
        ));
  }
}
