import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:investo/App_Screen/screen_1.dart';
import 'package:investo/KYC/Step1.dart';
import 'package:investo/main.dart';
import 'package:investo/user_info/Login_page.dart';
import 'package:investo/user_info/Signup_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  String our_otp = "1234";
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
get_permission()
async {
  if (await Permission.sms.isDenied) {
    Permission.sms.request();
  }
  if (await Permission.sms.isPermanentlyDenied) {
    openAppSettings();
  }
  if (await Permission.location.isDenied) {
    Permission.location.request();
  }
  if (await Permission.location.isPermanentlyDenied) {
    openAppSettings();
  }

}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_permission();
  }
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: IconButton(
                      onPressed: () {
                        (OnBordingScreen.is_signup)
                            ? Navigator.pushReplacement(
                                context,
                                PageTransition(duration: Duration(milliseconds: 500),
                                    child: Login(),
                                    type: PageTransitionType.fade))
                            : Navigator.pushReplacement(context, PageTransition(child: SignUp(), type: PageTransitionType.fade));
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
                Text(
                  "Verification",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 25),
                )
              ]),
            ),
            Expanded(
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Enter your code",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 35),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Please type the code we sent to",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.normal, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "+91 ${OnBordingScreen.mobile_number!["number"]}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.teal, fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Neumorphic(
                    style: NeumorphicStyle(
                        color: Theme.of(context).primaryColor,
                        shape: NeumorphicShape.concave,
                        depth: 3,
                        shadowDarkColor: Colors.deepPurple.shade900),
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Align(alignment: Alignment.center,
                        child: TextField(
                            controller: t1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(border: InputBorder.none),
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ]),
                      ),
                    ),
                  ),
                  Neumorphic(
                    style: NeumorphicStyle(
                        color: Theme.of(context).primaryColor,
                        shape: NeumorphicShape.concave,
                        depth: 3,
                        shadowDarkColor: Colors.deepPurple.shade900),
                    child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Align(alignment: Alignment.center,
                          child: TextField(
                              controller: t2,
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                                if(value.length==0)
                                {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ]),
                        )),
                  ),
                  Neumorphic(
                    style: NeumorphicStyle(
                        color: Theme.of(context).primaryColor,
                        shape: NeumorphicShape.concave,
                        depth: 3,
                        shadowDarkColor: Colors.deepPurple.shade900),
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Align(alignment: Alignment.center,
                        child: TextField(
                            controller: t3,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(border: InputBorder.none),
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                              if(value.length==0)
                              {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ]),
                      ),
                    ),
                  ),
                  Neumorphic(
                    style: NeumorphicStyle(
                        color: Theme.of(context).primaryColor,
                        shape: NeumorphicShape.concave,
                        depth: 3,
                        shadowDarkColor: Colors.deepPurple.shade900),
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Align(alignment: Alignment.center,
                        child: TextField(
                            controller: t4,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(border: InputBorder.none),
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              if(value.length==0)
                              {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Fluttertoast.showToast(msg: "Enter: 1234");
                },
                child: Text(
                  "Resend code",
                  style: Theme.of(context).textTheme.titleSmall,
                )),
            Expanded(flex: 3, child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      String user_otp = t1.text.toString() +
                          t2.text.toString() +
                          t3.text.toString() +
                          t4.text.toString();
                      if (our_otp == user_otp) {
                        if (OnBordingScreen.is_signup) {
                          OnBordingScreen.prefs!.setBool("is_login", true);
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: Duration(milliseconds: 500),
                                  child: Screen_1(),
                                  type: PageTransitionType.fade));
                        } else {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  duration: Duration(milliseconds: 500),
                                  child: Step1(),
                                  type: PageTransitionType.fade));
                        }
                      } else {
                        Fluttertoast.showToast(msg: "Enter Correct Code");
                      }
                    },
                    style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(200, 50)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xffA6A5EF))),
                    child: Text("Submit",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 25, fontWeight: FontWeight.normal)))
              ],
            ),
            SizedBox(
              height: 80,
            )
          ],
        )),
      ),
    );
  }
}
