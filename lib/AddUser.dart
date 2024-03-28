import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Model/userModel2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'colorpage.dart';
import 'imagepage.dart';
import 'main.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();

  final emailvalidation = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passwordvalidation =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final formkey = GlobalKey<FormState>();

  String imgUrl="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5khmUDCAdsuzFFIGr-dX9GU6rf7a-cMgzbgaBFB6unBnQn9cmauHaXfdVHqFj6y_6WR8&usqp=CAU";

  File? file;
  pickimage(ImageSource source) async {
    var PickedFile =
        await ImagePicker.platform.getImageFromSource(source: source);
    file = File(PickedFile!.path);
    if (mounted) {
      file = File(PickedFile.path);
      setState(() {});
    }
    uploadFile();
  }

  uploadFile() async {
    String format=file!.path.split(".").last;
    var uploadTask = await FirebaseStorage.instance
        .ref("Upload/images")
        .child(DateTime.now().toString())
        .putFile(file!, SettableMetadata(
        contentType: "image/$format"));
    var getUrl =await uploadTask.ref.getDownloadURL();

    imgUrl=getUrl;
    setState(() {

    });

  }


  bool a = true;
  bool b = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Add User",
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
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                              radius: width * 0.17,
                              backgroundImage:
                                 NetworkImage(imgUrl),
                            ),
                      Positioned(
                        top: width * 0.26,
                        left: width * 0.23,
                        child: InkWell(
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return CupertinoActionSheet(
                                  actions: [
                                    CupertinoActionSheetAction(
                                        onPressed: () async {
                                          await pickimage(ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Photo Gallery",
                                          style: TextStyle(color: Colors.blue),
                                        )),
                                    CupertinoActionSheetAction(
                                        onPressed: () {
                                          pickimage(ImageSource.camera);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Camera",
                                          style: TextStyle(color: Colors.blue),
                                        )),
                                  ],
                                  cancelButton: CupertinoActionSheetAction(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: width * 0.035,
                                backgroundColor: ColorPage.primarycolor,
                              ),
                              Positioned(
                                  top: width * 0.017,
                                  left: width * 0.015,
                                  child: SvgPicture.asset(
                                    ImagePage.pencil,
                                    color: ColorPage.white,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: Container(
                  height: height * 0.55,
                  // color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        controller: name,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.person,
                            color: ColorPage.primarycolor,
                          ),
                          labelText: "Full name",
                          labelStyle: TextStyle(color: Colors.grey.shade500),
                          filled: true,
                          fillColor: ColorPage.lightgray,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              borderSide:
                                  BorderSide(color: ColorPage.lightgray)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorPage.lightgray),
                              borderRadius:
                                  BorderRadius.circular(width * 0.03)),
                        ),
                      ),
                      TextFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.mail_outline,
                            color: ColorPage.primarycolor,
                          ),
                          labelText: "Valid email",
                          labelStyle: TextStyle(color: Colors.grey.shade500),
                          filled: true,
                          fillColor: ColorPage.lightgray,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              borderSide:
                                  BorderSide(color: ColorPage.lightgray)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorPage.lightgray),
                              borderRadius:
                                  BorderRadius.circular(width * 0.03)),
                        ),
                      ),
                      TextFormField(
                        controller: password,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        obscureText: a,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () {
                              a = !a;
                              setState(() {});
                            },
                            child: Icon(
                              a ? Icons.lock : Icons.lock_open,
                              color: ColorPage.primarycolor,
                            ),
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.grey.shade500),
                          filled: true,
                          fillColor: ColorPage.lightgray,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              borderSide:
                                  BorderSide(color: ColorPage.lightgray)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorPage.lightgray),
                              borderRadius:
                                  BorderRadius.circular(width * 0.03)),
                        ),
                      ),
                      TextFormField(
                        controller: password2,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: b,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () {
                              b = !b;
                              setState(() {});
                            },
                            child: Icon(
                              b ? Icons.lock : Icons.lock_open,
                              color: ColorPage.primarycolor,
                            ),
                          ),
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(color: Colors.grey.shade500),
                          filled: true,
                          fillColor: ColorPage.lightgray,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              borderSide:
                                  BorderSide(color: ColorPage.lightgray)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorPage.lightgray),
                              borderRadius:
                                  BorderRadius.circular(width * 0.03)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: height * 0.2,
                // color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Map<String, dynamic> data = {
                          // "name": name.text,
                          // "image":imgUrl,
                          // "email": email.text,
                          // "password": password.text,
                          // "confirm password": password2.text
                        };
                        FirebaseFirestore.instance
                            .collection("users")
                            .add(UserModel2(name: name.text, email: email.text, password: password.text, password2: password2.text).toMap() )
                            .then((value) {
                          value.update({"id": value.id});
                        });
                        // FirebaseFirestore.instance.collection("users2").doc(email.text).set(data);
                        Navigator.pop(context);
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
                              "Add User",
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
            ],
          ),
        ),
      ),
    );
  }
}
