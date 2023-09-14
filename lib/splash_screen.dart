import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:investo/App_Screen/screen_1.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:investo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  void initState() {
    // TODO: implement initState
    super.initState();
   prefs();
  }
  prefs()
  async {
    OnBordingScreen.prefs=await SharedPreferences.getInstance();
    OnBordingScreen.is_login=OnBordingScreen.prefs!.getBool("is_login")??false;
    OnBordingScreen.is_signup=OnBordingScreen.prefs!.getBool("is_sign_up")??false;
    setState(() {

    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: AnimatedSplashScreen(
            nextScreen:(OnBordingScreen.is_login==true)?Screen_1():OnBordingScreen(),
            curve: Curves.slowMiddle,backgroundColor: Colors.black,
            splashIconSize: double.infinity,
            splashTransition: SplashTransition.fadeTransition,
            animationDuration: Duration(seconds: 1),
            pageTransitionType: PageTransitionType.fade,
            duration: 1000,
            splash: Container(
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/Images/Logo.png"),
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Investo",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    """All your stock and mutual fund
transactionsin one place.Track Stocks
and portfolio, buy and sell.""",
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
