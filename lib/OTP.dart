import 'package:crud/HomePage.dart';
import 'package:crud/colorpage.dart';
import 'package:crud/imagepage.dart';
import 'package:crud/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

import 'main.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  static const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
  static const fillColor = Color.fromRGBO(243, 246, 249, 0);
  static const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: ColorPage.primarycolor),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorPage.white,
        appBar: AppBar(
          title: Text(
            "Verify OTP",
            style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.w500),
          ),
          backgroundColor: ColorPage.white,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ))),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(ImagePage.OTP),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "OTP has been sent to ",
                  style: TextStyle(color: Colors.grey.shade400),
                ),
                Text(
                  "*****634",
                  style: TextStyle(color: ColorPage.primarycolor),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                SvgPicture.asset(
                  ImagePage.pencil,
                  color: ColorPage.primarycolor,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
              child: FractionallySizedBox(
                child: Pinput(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  closeKeyboardWhenCompleted: true,
                  length: 6,
                  disabledPinTheme: PinTheme(
                      constraints: BoxConstraints(
                          maxHeight: width * 0.2, maxWidth: width * 0.1),
                      decoration: BoxDecoration(
                          color: ColorPage.lightgray,
                          borderRadius: BorderRadius.circular(width * 0.04))),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(),), (route) => false);
                setState(() {});
              },
              child: Container(
                height: width * 0.15,
                width: width * 0.65,
                decoration: BoxDecoration(
                    border: Border.all(color: ColorPage.primarycolor),
                    borderRadius: BorderRadius.circular(width * 0.09)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(width: width*0.05,),
                    Text(
                      "Verify",
                      style: TextStyle(
                        color: ColorPage.primarycolor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RichText(
                text: TextSpan(
                    style: TextStyle(
                  fontSize: width*0.035
                ),
              children: [
                TextSpan(
                  text: "Haven't got the confirmation code yet?",
                  style: TextStyle(color: ColorPage.black,
                  fontWeight: FontWeight.w400)
                ),
                TextSpan(
                  text:"Resend",
                  style: TextStyle(
                    color: ColorPage.primarycolor,
                    fontWeight: FontWeight.w500
                  )
                )
              ]
            )),
            Container(
              height: width*0.2,
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Try Another",
                        style: TextStyle(color: ColorPage.black)
                      ),
                      TextSpan(
                        text: " Method?",
                      style: TextStyle(color: ColorPage.primarycolor,
                      fontWeight: FontWeight.w500)
                      )
                    ]
                  ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
