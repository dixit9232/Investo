import 'package:flutter/material.dart';

class Intropage3 extends StatelessWidget {
  const Intropage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(height: 300,width: 300,fit: BoxFit.fill,
                "assets/Images/016-strategy.png"),
            SizedBox(width: 30,),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "More Secure",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        SizedBox(height: 30,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              """Change your fund to another Digital assets
or transfer stock more safely.""",
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ])),
    );
  }
}
