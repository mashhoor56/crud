import 'package:crud/Login2.dart';
import 'package:crud/colorpage.dart';
import 'package:crud/imagepage.dart';
import 'package:crud/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: height * 0.95,
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(ImagePage.image1),
                  Column(
                    children: [
                      Text(
                        "CRUD",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: ColorPage.primarycolor,
                            fontSize: width * 0.08),
                      ),
                      Text(
                        "Create, Read, Update ,Delete",
                        style: TextStyle(
                            color: ColorPage.primarycolor,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login2(),), (route) => false);
                      setState(() {});
                    },
                    child: Container(
                      height: width * 0.15,
                      width: width * 0.65,
                      decoration: BoxDecoration(
                          color: ColorPage.primarycolor,
                          borderRadius: BorderRadius.circular(width * 0.09)),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: ColorPage.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  InkWell(onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Signup(),));
                  },
                    child: Container(
                      height: width * 0.15,
                      width: width * 0.65,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorPage.primarycolor),
                          borderRadius: BorderRadius.circular(width * 0.09)),
                      child: Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              color: ColorPage.primarycolor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
