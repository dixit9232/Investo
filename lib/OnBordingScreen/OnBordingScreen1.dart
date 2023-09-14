import 'package:flutter/material.dart';

class Intropage1 extends StatelessWidget {
  const Intropage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage(
                    "assets/Images/analytics.png",
                  ),
                  height: 300,
                  width: 300,
                  fit: BoxFit.fill),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                "Management Wallet",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(letterSpacing: 2),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
              ),
              Text("""Store and manage all your digital currencies
with ease in the smart wallet interface""",
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center),
            ],
          ),
        ]),
      ),
    );
  }
}
