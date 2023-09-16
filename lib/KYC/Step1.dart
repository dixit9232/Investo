import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:investo/KYC/confirm_page.dart';
import 'package:investo/main.dart';
import 'package:investo/user_info/Login_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Step1 extends StatefulWidget {
  const Step1({super.key});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  File? image_path;
  var image_pick = ImagePicker();
  var image;

  getImage() async {
    image = await image_pick.pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        save_image(image.path);
        image_path = File(image.path);
      }
    });
  }

  choose_image() async {
    image = await image_pick.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        save_image(image.path);
        image_path = File(image.path);
      }
    });
  }

  save_image(String path) async {
    OnBordingScreen.prefs = await SharedPreferences.getInstance();
    OnBordingScreen.prefs!.setString("path", path.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    if (OnBordingScreen.prefs!.getString("path") != null) {
      image_path = File(OnBordingScreen.prefs!.getString("path")!);
    }
    setState(() {});
  }

  get_permission_camera() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (androidInfo.version.sdkInt >= 33) {
      if (await Permission.photos.isDenied &&
          await Permission.manageExternalStorage.isDenied) {
        Permission.photos.request();
        Permission.manageExternalStorage.request();
      }
      if (await Permission.photos.isPermanentlyDenied &&
          await Permission.manageExternalStorage.isPermanentlyDenied) {
        openAppSettings();
      }
    }
    if (androidInfo.version.sdkInt < 33) {
      if (await Permission.storage.isDenied) {
        Permission.storage.request();
      }
      if (await Permission.storage.isPermanentlyDenied) {
        openAppSettings();
      }
    }
  }

  get_permission_gallary() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (androidInfo.version.sdkInt >= 33) {
      if (await Permission.photos.isDenied &&
          await Permission.manageExternalStorage.isDenied) {
        Permission.photos.request();
        Permission.manageExternalStorage.request();
      }
      if (await Permission.photos.isPermanentlyDenied &&
          await Permission.manageExternalStorage.isPermanentlyDenied) {
        openAppSettings();
      }
    }
    if (androidInfo.version.sdkInt < 33) {
      if (await Permission.storage.isDenied) {
        Permission.storage.request();
      }
      if (await Permission.storage.isPermanentlyDenied) {
        openAppSettings();
      }
    }
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
                  padding: const EdgeInsets.all(20.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 500),
                                child: Login(),
                                type: PageTransitionType.fade));
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      )),
                ),
                Text(
                  "Step 1",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 25),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Take your photo",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 35),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    """Make sure your face is not covered with any
eyewear, jwellery or any other things.""",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 250,
                    width: 250,
                    child: (image_path == null)
                        ? Image.asset(
                            fit: BoxFit.fill, "assets/Images/camera 1.png")
                        : Image.file(image_path!, fit: BoxFit.fill),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100,),
            ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(350, 50)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xffA6A5EF))),
                onPressed: () {
                  get_permission_camera();
                  getImage();
                },
                child: Text(
                  "Take a Photo",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.normal, fontSize: 25),
                )),
            SizedBox(height: 30),
            OutlinedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(350, 50)),
                    side: MaterialStatePropertyAll(BorderSide(
                        style: BorderStyle.solid, color: Colors.white))),
                onPressed: () {
                  get_permission_gallary();
                  choose_image();
                },
                child: Text(
                  "Choose Photo",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.normal, fontSize: 25),
                )),
            Expanded(
              child: Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(350, 50)),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                          backgroundColor: (image_path == null)
                              ? MaterialStatePropertyAll(Color(0x2ca6a5ef))
                              : MaterialStatePropertyAll(Color(0xffA6A5EF))),
                      onPressed: (image_path != null)
                          ? () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      duration: Duration(milliseconds: 500),
                                      child: Confirm(image_path),
                                      type: PageTransitionType.fade));
                            }
                          : null,
                      child: Text(
                        "Next",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.normal,
                            color:
                                (image_path == null) ? Colors.white54 : Colors.white,
                            fontSize: 25),
                      )),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
