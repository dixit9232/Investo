import 'package:flutter/material.dart';
import 'package:investo/App_Screen/screen_1.dart';
import 'package:page_transition/page_transition.dart';

class News_page extends StatefulWidget {
  int index;

  News_page(this.index);

  @override
  State<News_page> createState() => _News_pageState();
}

class _News_pageState extends State<News_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: IconButton(
                      splashRadius: 0.1,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: Screen_1(2),
                                duration: Duration(milliseconds: 500),
                                type: PageTransitionType.fade));
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
                Text(
                  "Details",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            SizedBox(
              height: 300,
              child:
                  Image.asset("assets/Images/Group 3725.png", fit: BoxFit.fill),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Text(
                      softWrap: true,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 20),
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
