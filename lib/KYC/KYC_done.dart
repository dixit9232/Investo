import 'package:flutter/material.dart';
import 'package:investo/App_Screen/screen_1.dart';
import 'package:investo/main.dart';
import 'package:page_transition/page_transition.dart';

class KYC_Done extends StatefulWidget {
  const KYC_Done({super.key});

  @override
  State<KYC_Done> createState() => _KYC_DoneState();
}

class _KYC_DoneState extends State<KYC_Done> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 250),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  "assets/Images/checkmark 1.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            "Congratulations!",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            """Your profile has been verified.
Please continue to explore investovo""",
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          Expanded(flex: 1,
            child: Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(350, 50)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor: MaterialStatePropertyAll(Color(0xffA6A5EF))),
                    onPressed: () {
                      OnBordingScreen.prefs!.setBool("is_sign_up", true);
                      OnBordingScreen.prefs!.setBool("is_login", true);
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              duration: Duration(milliseconds: 500),
                              child: Screen_1(),
                              type: PageTransitionType.fade));
                    },
                    child: Text("Next",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 25, fontWeight: FontWeight.normal))),
              ],
            ),
          ),
          SizedBox(height: 30,)
        ],
      )),
    );
  }
}
