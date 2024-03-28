import 'package:crud/HomePage.dart';
import 'package:crud/Login.dart';
import 'package:crud/Login2.dart';
import 'package:crud/colorpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool login = false;
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    login = prefs.getBool("login") ?? false;

    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    login == true ? const HomePage() : const Login(),
              ),
            ));
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPage.primarycolor,
      body: Center(
        child: Text(
          "CRUD",
          style: TextStyle(
              color: ColorPage.white,
              fontSize: width * 0.1,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
