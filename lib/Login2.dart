import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/homepage1.dart';
import 'package:crud/HomePage.dart';
import 'package:crud/Phone.dart';
import 'package:crud/colorpage.dart';
import 'package:crud/imagepage.dart';
import 'package:crud/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final auth = await FirebaseAuth.instance.signInWithCredential(credential);




    User? userDetails = auth.user;
    UserName = userDetails!.displayName;
    UserEmail = userDetails.email;
    Userimage = userDetails.photoURL;

    var userlist = await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: UserEmail)
        .get();
    if (userlist.docs.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Signup(),
          ));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => home_page1(),
          ));
    }
  }

  bool a = true;

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  // final emailvalidation=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passwordvalidation =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final usernameRegex = RegExp(r'^[a-zA-Z0-9]{5,20}$');
  final formkey = GlobalKey<FormState>();

  setData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("login", true);
  }

  loginUsingGetMethod() async {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: usernamecontroller.text)
        .get();

    print(data.docs);

    if (data.docs.isNotEmpty) {
      if (data.docs[0]["password"] == passwordcontroller.text) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => home_page1(),
            ),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: ColorPage.primarycolor,
            content: Text("Passwords do not match")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: ColorPage.primarycolor,
          content: Text("No account found")));
    }
  }

  loginUsingAuth() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: usernamecontroller.text, password: passwordcontroller.text)
        .then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
          (route) => false);
    }).catchError((error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPage.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "CRUD",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: ColorPage.white,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(ImagePage.PasswordImage),
              Container(
                height: width * 0.57,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: usernamecontroller,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      // validator: (value) {
                      //   if (usernameRegex.hasMatch(value!)) {
                      //     return null;
                      //   } else {
                      //     return "pls enter valid Username";
                      //   }
                      // },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          labelText: "Username",
                          constraints: BoxConstraints(maxWidth: width * 0.9),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width * 0.03),
                            borderSide:
                                BorderSide(color: ColorPage.primarycolor),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.red.shade800,
                                  width: width * 0.005),
                              borderRadius:
                                  BorderRadius.circular(width * 0.03)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              borderSide: BorderSide(
                                color: Colors.red.shade800,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorPage.primarycolor),
                              borderRadius:
                                  BorderRadius.circular(width * 0.03))),
                    ),
                    // SizedBox(
                    //   height: width * 0.05,
                    // ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordcontroller,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: a,
                      obscuringCharacter: "*",
                      // validator: (value) {
                      //   if (passwordvalidation.hasMatch(value!)) {
                      //     return null;
                      //   } else {
                      //     return "pls enter valid password";
                      //   }
                      // },
                      decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: InkWell(
                            onTap: () {
                              a = !a;
                              setState(() {});
                            },
                            child: Icon(
                              a
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                            )),
                        constraints: BoxConstraints(maxWidth: width * 0.9),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorPage.primarycolor),
                            borderRadius: BorderRadius.circular(width * 0.03)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorPage.primarycolor),
                            borderRadius: BorderRadius.circular(width * 0.03)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width * 0.03),
                            borderSide:
                                BorderSide(color: ColorPage.primarycolor)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: width * 0.6,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        loginUsingAuth();
                        setData();

                        //   if (formkey.currentState!.validate() &&
                        //       namecontroller.text.isNotEmpty &&
                        //       namecontroller1.text.isNotEmpty) {
                        //     Navigator.pushAndRemoveUntil(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => HomePage(),
                        //         ),
                        //         (route) => false);
                        //   } else {
                        //     namecontroller1.toString() == ""
                        //         ? ScaffoldMessenger.of(context).showSnackBar(
                        //             SnackBar(
                        //                 content: Text("please enter your Name")))
                        //         : ScaffoldMessenger.of(context).showSnackBar(
                        //             SnackBar(
                        //                 content:
                        //                     Text("enter your valid Details")));
                        //
                        //     namecontroller.text.isEmpty
                        //         ? ScaffoldMessenger.of(context).showSnackBar(
                        //             SnackBar(
                        //                 content:
                        //                     Text("Please enter the Username")))
                        //         : ScaffoldMessenger.of(context).showSnackBar(
                        //             SnackBar(
                        //                 content:
                        //                     Text("Please enter the Password")));
                        //   }
                      },
                      child: Container(
                        height: width * 0.15,
                        width: width * 0.65,
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorPage.primarycolor),
                            borderRadius: BorderRadius.circular(width * 0.09)),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SizedBox(width: width*0.05,),
                            Container(
                              width: width * 0.45,
                              // color: Colors.blue,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SvgPicture.asset(
                                    ImagePage.lockicon,
                                    color: ColorPage.primarycolor,
                                  ),
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                        color: ColorPage.primarycolor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        signInWithGoogle();
                      },
                      child: Container(
                        height: width * 0.15,
                        width: width * 0.65,
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorPage.primarycolor),
                            borderRadius: BorderRadius.circular(width * 0.09)),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SizedBox(width: width*0.05,),
                            Container(
                              width: width * 0.6,
                              // color: Colors.blue,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(ImagePage.google),
                                  Text(
                                    " Sign in with Google",
                                    style: TextStyle(
                                        color: ColorPage.primarycolor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Phone(),
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
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SizedBox(width: width*0.05,),
                            Container(
                              width: width * 0.49,
                              // color: Colors.blue,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SvgPicture.asset(
                                    ImagePage.callicon,
                                    color: ColorPage.primarycolor,
                                  ),
                                  Text(
                                    "OTP sign in",
                                    style: TextStyle(
                                      color: ColorPage.primarycolor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signup(),
                      ));
                },
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Don’t have an account ? ",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: ColorPage.primarycolor)),
                  TextSpan(
                      text: "Create Now",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ColorPage.primarycolor))
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
