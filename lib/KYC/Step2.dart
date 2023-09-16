import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:investo/KYC/Step1.dart';
import 'package:investo/KYC/Step3.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';

class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  TextEditingController PAN_number = TextEditingController();
  TextEditingController d_o_b = TextEditingController();
  TextEditingController name = TextEditingController();

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    duration: Duration(milliseconds: 500),
                                    child: Step1(),
                                    type: PageTransitionType.fade));
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          )),
                    ),
                    Text(
                      "Step 2",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 25),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Proof of identity",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 35),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        """By adding your Pan detail, we can connect your
investment account with investovo""",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    )
                  ],
                ),
              ),
             Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Container(
                     decoration: BoxDecoration(
                         color: Color(0xff6e6ea4),
                         borderRadius: BorderRadius.circular(10)),
                     child: TextField(
                         controller: PAN_number,
                         style: Theme.of(context)
                             .textTheme
                             .titleMedium!
                             .copyWith(
                             fontSize: 20,
                             fontWeight: FontWeight.normal),
                         keyboardType: TextInputType.name,
                         inputFormatters: [
                           FilteringTextInputFormatter.allow(
                               RegExp("[a-zA-Z0-9]"))
                         ],
                         textAlign: TextAlign.left,
                         decoration: InputDecoration(
                           hintText: "\t\t\tEnter your PAN card number",
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
                         keyboardType: TextInputType.none,
                         controller: d_o_b,
                         onTap: () async {

                           if(await Permission.calendar.isGranted)
                           {
                             DateTime? date = await showDatePicker(
                                 context: context,
                                 initialDate: DateTime.now(),
                                 firstDate: DateTime(1900),
                                 lastDate: DateTime.now());
                             if (date != null) {
                               setState(() {
                                 d_o_b.text =
                                     DateFormat("dd-MM-yyyy").format(date);
                               });
                             }
                           }
                           else
                           {
                             Permission.calendar.request();
                           }
                           setState(() {

                           });
                         },
                         style: Theme.of(context)
                             .textTheme
                             .titleMedium!
                             .copyWith(
                             fontSize: 20,
                             fontWeight: FontWeight.normal),
                         textAlign: TextAlign.left,
                         decoration: InputDecoration(
                           suffixIcon: Icon(
                             Icons.calendar_today_outlined,
                             color: Colors.white,
                             size: 30,
                           ),
                           hintText: "\t\t\tDate of Birth",
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
                   padding: const EdgeInsets.all(10),
                   child: Container(
                     decoration: BoxDecoration(
                         color: Color(0xff6e6ea4),
                         borderRadius: BorderRadius.circular(10)),
                     child: TextField(
                         controller: name,
                         style: Theme.of(context)
                             .textTheme
                             .titleMedium!
                             .copyWith(
                             fontSize: 20,
                             fontWeight: FontWeight.normal),
                         keyboardType: TextInputType.name,
                         textAlign: TextAlign.left,
                         decoration: InputDecoration(
                           hintText: "\t\t\tEnter name as on PAN card",
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
               ],
             ),
              SizedBox(height: 120,),
              Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            fixedSize: MaterialStatePropertyAll(Size(350, 50)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xffA6A5EF))),
                        onPressed: () {
                          if (PAN_number.text != "" &&
                              d_o_b.text != "" &&
                              name.text != "") {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    duration: Duration(milliseconds: 500),
                                    child: Step3(),
                                    type: PageTransitionType.fade));
                          } else {
                            Fluttertoast.showToast(
                              msg: "Please fill all required fields",
                            );
                          }
                        },
                        child: Text("Next",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 25,
                                    fontWeight: FontWeight.normal))),
                  ],
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
