import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:investo/KYC/Step1.dart';
import 'package:investo/KYC/Step2.dart';
import 'package:investo/main.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Confirm extends StatefulWidget {
  File? file;

  Confirm([this.file]);

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  var image_pick = ImagePicker();
var image;
  getImage() async {
    image = await image_pick.pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        save_image(image.path);
        widget.file = File(image.path);
      }
    });
  }

  choose_image() async {
    image = await image_pick.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        save_image(image.path);
        widget.file = File(image.path);
      }
    });
  }
  save_image(String path) async {
    OnBordingScreen.prefs = await SharedPreferences.getInstance();
    OnBordingScreen.prefs!.setString("path", path.toString());
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(duration: Duration(milliseconds: 500),
                                child: Step1(), type: PageTransitionType.fade));
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.5),
                  child: Text(
                    "Take your photo",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 45),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  child: (widget.file == null)
                      ? Image.asset(
                          "assets/Images/Path.png",
                          fit: BoxFit.fill,
                        )
                      : Image.file(
                          widget.file!,
                          fit: BoxFit.fill,
                        ),
                )
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(350, 60)),
                        side: MaterialStatePropertyAll(BorderSide(
                            style: BorderStyle.solid, color: Colors.white))),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shadowColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  NeumorphicButton(
                                      style: NeumorphicStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                      onPressed: () {
                                        getImage();
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Cemera",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      )),
                                  NeumorphicButton(
                                      style: NeumorphicStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                      onPressed: () {
                                        choose_image();
                                        Navigator.pop(context);
                                      },
                                      child: Text("Gallery",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white))),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Take Another Photo",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 25, fontWeight: FontWeight.normal))),
              ],
            ),

            ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(350, 50)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xffA6A5EF))),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          duration: Duration(milliseconds: 500),
                          child: Step2(),
                          type: PageTransitionType.fade));
                },
                child: Text(
                  "Next",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 25),
                )),
SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
