import 'package:country_code_picker/country_code_picker.dart';
import 'package:crud/OTP.dart';
import 'package:crud/colorpage.dart';
import 'package:crud/imagepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPage.white,
      appBar: AppBar(
        title: Text(
          "Enter Phone Number",
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
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(ImagePage.phonepageimage),
            Container(
              height: height * 0.3,
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    // maxLength: 10,
                    decoration: InputDecoration(
                      labelText: "Phone No",
                      // prefixText: "+91",
                      prefixIcon: CountryCodePicker(
                        onChanged: print,
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'IT',
                        favorite: ['+39', 'FR'],
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                      ),

                      constraints: BoxConstraints(maxWidth: width * 0.9),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorPage.primarycolor),
                          borderRadius: BorderRadius.circular(width * 0.03)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorPage.primarycolor),
                          borderRadius: BorderRadius.circular(width * 0.03)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * 0.03),
                          borderSide:
                              BorderSide(color: ColorPage.primarycolor)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OTP(),
                          ));
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
                            "Send OTP",
                            style: TextStyle(
                              color: ColorPage.primarycolor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: width * 0.35,
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Sign in with ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: ColorPage.black)),
                    TextSpan(
                        text: " Another Method ?",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: ColorPage.primarycolor))
                  ])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
