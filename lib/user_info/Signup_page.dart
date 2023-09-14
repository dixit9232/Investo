import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:investo/main.dart';
import 'package:investo/user_info/Login_page.dart';
import 'package:investo/user_info/otp_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool password_visible = true;

  get_permission() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (await Permission.contacts.isDenied) {
      Permission.contacts.request();
    }
    if (await Permission.contacts.isPermanentlyDenied) {
      openAppSettings();
    }
    if (await Permission.sms.isDenied) {
      Permission.sms.request();
    }
    if (await Permission.sms.isPermanentlyDenied) {
      openAppSettings();
    }
    if(androidInfo.version.sdkInt>=33)
      {
        if(await Permission.manageExternalStorage.isDenied)
          {
            Permission.manageExternalStorage.request();
          }
        if(await Permission.manageExternalStorage.isPermanentlyDenied)
          {
            openAppSettings();
          }
      }
    if(androidInfo.version.sdkInt<33)
    {
      if(await Permission.storage.isDenied)
      {
        Permission.storage.request();
      }
      if(await Permission.storage.isPermanentlyDenied)
      {
        openAppSettings();
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prefrence();
    get_permission();
  }

  prefrence() async {
    OnBordingScreen.prefs = await SharedPreferences.getInstance();
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
                    "Let's get started",
                    style: Theme.of(context).textTheme.titleMedium,
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
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[a-z A-Z]'))
                                  ],
                                  controller: namecontroller,
                                  keyboardType: TextInputType.name,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    hintText: "\t\t\tFull name",
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
                            SizedBox(
                              height: 10,
                            ),
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
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10)
                                  ],
                                  controller: numbercontroller,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "\t\t\tPhone number",
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
                            SizedBox(
                              height: 10,
                            ),
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
                                  controller: mailcontroller,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    hintText: "\t\t\tEmail address",
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
                            SizedBox(
                              height: 10,
                            ),
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
                                  controller: passwordcontroller,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: password_visible,
                                  decoration: InputDecoration(
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: IconButton(
                                          splashRadius: 0.1,
                                          onPressed: () {
                                            setState(() {
                                              if (password_visible) {
                                                password_visible = false;
                                              } else {
                                                password_visible = true;
                                              }
                                            });
                                          },
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            size: 30,
                                            color: Colors.white,
                                          )),
                                    ),
                                    hintText: "\t\t\tPassword (8+characters)",
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
                            SizedBox(
                              height: 20,
                            ),
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
                                      if (namecontroller.text.toString() != "" &&
                                          numbercontroller.text.toString() !=
                                              "" &&
                                          mailcontroller.text.toString() !=
                                              "" &&
                                          passwordcontroller.text.toString() !=
                                              "") {
                                        OnBordingScreen.prefs!.setString("name",
                                            namecontroller.text.toString());
                                        OnBordingScreen.prefs!.setString(
                                            "phone_number",
                                            numbercontroller.text.toString());
                                        OnBordingScreen.prefs!.setString("mail",
                                            mailcontroller.text.toString());
                                        OnBordingScreen.prefs!.setString(
                                            "password",
                                            passwordcontroller.text.toString());
                                        OnBordingScreen.mobile_number = {
                                          "number": OnBordingScreen.prefs!
                                              .getString("phone_number")
                                        };
                                        Navigator.pushReplacement(
                                            context,
                                            PageTransition(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                child: OTP(),
                                                type: PageTransitionType.fade));
                                      } else {
                                        Fluttertoast.showToast(
                                          msg:
                                              "Please fill all required fields",
                                        );
                                      }
                                    },
                                    child: Text("Get Started",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                fontSize: 25,
                                                fontWeight:
                                                    FontWeight.normal))),
                              ],
                            ),
                            SizedBox(
                              height: 45,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Already have an account?",
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
                                              child: Login(),
                                              type: PageTransitionType.fade));
                                    },
                                    child: Text("Signin",
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
