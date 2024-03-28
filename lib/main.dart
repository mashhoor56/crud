import 'package:crud/Login.dart';
import 'package:crud/Login2.dart';
import 'package:crud/SplashScreen.dart';
import 'package:crud/food_page.dart';
import 'package:crud/signup.dart';
import 'package:crud/task.dart';
import 'package:crud/task_page2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';


///add hello

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
var UserName;
var UserEmail;
var Userimage;

var width;
var height;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    print("main page");

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // textTheme:  GoogleFonts.rubikBubblesTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:Cart_Task(),

        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
