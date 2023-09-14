import 'package:flutter/material.dart';

class Intropage2 extends StatelessWidget {
  const Intropage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(width: 300,height: 300,fit: BoxFit.fill,
                "assets/Images/presentation.png",
              ),
              SizedBox(width: 30,),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Analytics & Statistics",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                """Just sending out a few ads is not going to do
it.Not if you want to be a real success""",
                style: Theme.of(context).textTheme.titleSmall,textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
