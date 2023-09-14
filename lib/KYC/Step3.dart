import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:investo/KYC/KYC_done.dart';
import 'package:investo/KYC/Step2.dart';
import 'package:page_transition/page_transition.dart';

class Step3 extends StatefulWidget {
  const Step3({super.key});

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  TextEditingController ac_no = TextEditingController();
  TextEditingController IFSC = TextEditingController();
  TextEditingController name = TextEditingController();
  bool account_type = false;

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 500),
                                child: Step2(),
                                type: PageTransitionType.fade));
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
                Text(
                  "Step 3",
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Add bank account",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 40),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    """Adding your bank details help you to get your
investments done quickly.""",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff6e6ea4),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                    controller: ac_no,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16)
                    ],
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: "\t\t\tBank Account Number",
                      hintStyle: TextStyle(
                        letterSpacing: 2,
                        wordSpacing: 2,
                        color: Colors.white38,
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff6e6ea4),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                    controller: IFSC,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.characters,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp("[A-Z0-9]"))
                    ],
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: "\t\t\tIFSC Code",
                      hintStyle: TextStyle(
                        letterSpacing: 2,
                        wordSpacing: 2,
                        color: Colors.white38,
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
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
                    keyboardType: TextInputType.name,
                    controller: name,
                    inputFormatters: [
                      FilteringTextInputFormatter(RegExp("[a-zA-Z]"),
                          allow: true)
                    ],
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: "\t\t\tAccount Holder Name",
                      hintStyle: TextStyle(
                        letterSpacing: 2,
                        wordSpacing: 2,
                        color: Colors.white38,
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(170, 50)),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        backgroundColor: (account_type == false)
                            ? MaterialStatePropertyAll(Color(0xffA6A5EF))
                            : MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: () {
                      setState(() {
                        account_type = false;
                      });
                    },
                    child: Text("Savings",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 25,
                                fontWeight: FontWeight.normal))),
                ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(170, 50)),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        backgroundColor: (account_type)
                            ? MaterialStatePropertyAll(Color(0xffA6A5EF))
                            : MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: () {
                      setState(() {
                        account_type = true;
                      });
                    },
                    child: Text("Current",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 25, fontWeight: FontWeight.normal)))
              ],
            ),
            SizedBox(
              height: 130,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(350, 50)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xffA6A5EF))),
                onPressed: () {
                  if (ac_no.text != "" &&
                      IFSC.text != "" &&
                      name.text != "") {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 500),
                            child: KYC_Done(),
                            type: PageTransitionType.fade));
                  } else {
                    Fluttertoast.showToast(
                        msg: "Please fill all required fields");
                  }
                },
                child: Text("Next",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                            fontSize: 25, fontWeight: FontWeight.normal))),
            SizedBox(height: 30,)
          ],
        )),
      ),
    );
  }
}
