import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investo/main.dart';
import 'package:investo/user_info/Signup_page.dart';
import 'package:investo/user_info/otp_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  get() async {
    OnBordingScreen.prefs = await SharedPreferences.getInstance();
    OnBordingScreen.prefs!.getString("phone_number");
    OnBordingScreen.mobile_number = {
      "number": OnBordingScreen.prefs!.getString("phone_number")
    };
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "assets/Images/Logo.png",
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Investo",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(letterSpacing: 2),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Welcome Back",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 40),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.all(10.80),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff6e6ea4),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
                                  controller: controller,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    hintText: "\t\t\tEnter your mobile number",
                                    hintStyle: TextStyle(
                                      letterSpacing: 2,
                                      wordSpacing: 2,
                                      color: Colors.white38,
                                      fontSize: 20,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )),
                            ),
                            SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                    style: ButtonStyle(
                                        fixedSize: MaterialStatePropertyAll(
                                            Size(180, 60)),
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color(0xffA6A5EF))),
                                    onPressed: () {
                                      if (OnBordingScreen.is_signup) {
                                        if (controller.text.toString() != "" &&
                                            controller.text.toString() ==
                                                OnBordingScreen.prefs!
                                                    .getString(
                                                        "phone_number")) {
                                          Navigator.pushReplacement(
                                              context,
                                              PageTransition(duration: Duration(milliseconds: 500),
                                                  child: OTP(),
                                                  type: PageTransitionType
                                                      .rightToLeft));
                                        } else {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Account Is not found check details");
                                        }
                                      } else {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Account Is not found check details");
                                      }
                                    },
                                    child: Text("Send code",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                fontSize: 25,
                                                fontWeight:
                                                    FontWeight.normal))),
                              ],
                            ),
                            SizedBox(height: 50),
                            Row(
                              children: [
                                Text(
                                  "Try with Social Login",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0x91ffffff)),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Row(
                              children: [
                                NeumorphicButton(
                                    style: NeumorphicStyle(
                                        color: Theme.of(context).primaryColor,
                                        shape: NeumorphicShape.concave,
                                        depth: 3,
                                        shadowDarkColor:
                                            Colors.deepPurple.shade900),
                                    onPressed: () {},
                                    child: FaIcon(FontAwesomeIcons.google,
                                        color: Colors.white)),
                                SizedBox(
                                  width: 30,
                                ),
                                NeumorphicButton(
                                  style: NeumorphicStyle(
                                      color: Theme.of(context).primaryColor,
                                      shape: NeumorphicShape.concave,
                                      depth: 3,
                                      shadowDarkColor:
                                          Colors.deepPurple.shade900),
                                  onPressed: () {},
                                  child: FaIcon(FontAwesomeIcons.facebook,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                NeumorphicButton(
                                  style: NeumorphicStyle(
                                      color: Theme.of(context).primaryColor,
                                      shape: NeumorphicShape.concave,
                                      depth: 3,
                                      shadowDarkColor:
                                          Colors.deepPurple.shade900),
                                  onPressed: () {},
                                  child: FaIcon(FontAwesomeIcons.twitter,
                                      color: Colors.white),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 45,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Create a new account?",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0x91ffffff)),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          PageTransition(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              child: SignUp(),
                                              type: PageTransitionType.fade));
                                    },
                                    child: Text("Signup",
                                        style: TextStyle(
                                            fontFamily: "one",
                                            fontSize: 20,
                                            color: Color(0xffA6A5EF))))
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
