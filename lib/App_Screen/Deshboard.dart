import 'package:flutter/material.dart';
import 'package:investo/App_Screen/Stock_page.dart';
import 'package:investo/App_Screen/mutual_funds.dart';
import 'package:investo/App_Screen/screen_1.dart';

class DeshBoard extends StatefulWidget {
  const DeshBoard({super.key});

  @override
  State<DeshBoard> createState() => _DeshBoardState();
}

class _DeshBoardState extends State<DeshBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white12,
                  ),
                  height: 50,
                  width: 270,
                  child: TextField(
                    textAlign: TextAlign.start,
                    cursorHeight: 25,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 20, color: Colors.white38),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintText: "\tSearch...",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 20, color: Colors.white38),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white12,
                  radius: 25,
                  child: IconButton(
                      splashRadius: 0.1,
                      onPressed: () {},
                      icon: Icon(
                        Icons.bookmark,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white12,
                  radius: 25,
                  child: IconButton(
                      splashRadius: 0.1,
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(170, 50)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor: (Screen_1.stock == false)
                            ? MaterialStatePropertyAll(Color(0xffA6A5EF))
                            : MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: () {
                      setState(() {
                        Screen_1.stock = false;
                      });
                    },
                    child: Text("Stocks",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.normal))),
                ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(170, 50)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor: (Screen_1.stock)
                            ? MaterialStatePropertyAll(Color(0xffA6A5EF))
                            : MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: () {
                      setState(() {
                        Screen_1.stock = true;
                      });
                    },
                    child: Text("Mutual Funds",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.normal)))
              ],
            ),
            SizedBox(height: 30),
            Expanded(child: (Screen_1.stock == false) ? Stocks() : Mutual_Fund()),
          ],
        ),
      ),
    );
  }
}
