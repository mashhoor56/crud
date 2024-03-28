import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'colorpage.dart';
import 'imagepage.dart';
import 'main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController namecontroller1 = TextEditingController();
  TextEditingController namecontroller2 = TextEditingController();
  TextEditingController namecontroller3 = TextEditingController();

  final emailvalidation = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final passwordvalidation =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final formkey = GlobalKey<FormState>();

  File? file;

  pickimage(ImageSource source) async {
    var PickedFile =
        await ImagePicker.platform.getImageFromSource(source: source);
    file = File(PickedFile!.path);
    if (mounted) {
      file = File(PickedFile.path);
      setState(() {});
    }
  }
  bool a = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
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
                      file == null
                          ? CircleAvatar(
                              radius: width * 0.17,
                              backgroundImage:
                                  AssetImage(ImagePage.profilephoto),
                            )
                          : CircleAvatar(
                              radius: width * 0.17,
                              backgroundImage: FileImage(file!),
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
                  height: height * 0.5,
                  // color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: "Full name",
                          labelStyle: TextStyle(color: ColorPage.primarycolor),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              borderSide:
                                  BorderSide(color: ColorPage.primarycolor)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorPage.primarycolor),
                              borderRadius:
                                  BorderRadius.circular(width * 0.03)),
                        ),
                      ),
                      TextFormField(
                        controller: namecontroller,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,

                        decoration: InputDecoration(
                          labelText: "Valid email",
                          labelStyle: TextStyle(color: ColorPage.primarycolor),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              borderSide:
                                  BorderSide(color: ColorPage.primarycolor)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorPage.primarycolor),
                              borderRadius:
                                  BorderRadius.circular(width * 0.03)),
                        ),
                      ),
                      TextFormField(
                        controller: namecontroller2,
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
                                a
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility,
                              )),
                          labelText: "Password",
                          labelStyle: TextStyle(color: ColorPage.primarycolor),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              borderSide:
                                  BorderSide(color: ColorPage.primarycolor)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorPage.primarycolor),
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
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: Text(
                                "Are you Sure\n"
                                "You Want to Update Details?",
                                style: TextStyle(fontSize: width * 0.04),
                              ),
                              actions: [
                                Column(
                                  children: [
                                    CupertinoDialogAction(
                                        child: Text(
                                      "Confirm",
                                      style: TextStyle(color: Colors.blue),
                                    )),
                                    Divider(),
                                    CupertinoDialogAction(
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                    )
                                  ],
                                )
                              ],
                            );
                          },
                        );
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
                              "Update",
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
