import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/AddUser.dart';
import 'package:crud/Get.dart';
import 'package:crud/colorpage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'EditUser.dart';
import 'Login.dart';
import 'Profile.dart';
import 'imagepage.dart';
import 'main.dart';

class home_page1 extends StatefulWidget {
  const home_page1({super.key});

  @override
  State<home_page1> createState() => _home_page1State();
}

class _home_page1State extends State<home_page1> {
  // List A = [
  //   {
  //     "image": ImagePage.avatar,
  //     "text": "Albert Flores",
  //     "text1": "1901 Thornridge Cir. Shiloh, Hawaii",
  //     "image2": ImagePage.deleteicon,
  //     "image3": ImagePage.pencil,
  //   },
  //   {
  //     "image": ImagePage.avatar,
  //     "text": "Albert Flores",
  //     "text1": "1901 Thornridge Cir. Shiloh, Hawaii",
  //     "image2": ImagePage.deleteicon,
  //     "image3": ImagePage.pencil,
  //   },
  //   {
  //     "image": ImagePage.avatar,
  //     "text": "Albert Flores",
  //     "text1": "1901 Thornridge Cir. Shiloh, Hawaii",
  //     "image2": ImagePage.deleteicon,
  //     "image3": ImagePage.pencil,
  //   },
  //   {
  //     "image": ImagePage.avatar,
  //     "text": "Albert Flores",
  //     "text1": "1901 Thornridge Cir. Shiloh, Hawaii",
  //     "image2": ImagePage.deleteicon,
  //     "image3": ImagePage.pencil,
  //   },
  //   {
  //     "image": ImagePage.avatar,
  //     "text": "Albert Flores",
  //     "text1": "1901 Thornridge Cir. Shiloh, Hawaii",
  //     "image2": ImagePage.deleteicon,
  //     "image3": ImagePage.pencil,
  //   },
  //   {
  //     "image": ImagePage.avatar,
  //     "text": "Albert Flores",
  //     "text1": "1901 Thornridge Cir. Shiloh, Hawaii",
  //     "image2": ImagePage.deleteicon,
  //     "image3": ImagePage.pencil,
  //   },
  //   {
  //     "image": ImagePage.avatar,
  //     "text": "Albert Flores",
  //     "text1": "1901 Thornridge Cir. Shiloh, Hawaii",
  //     "image2": ImagePage.deleteicon,
  //     "image3": ImagePage.pencil,
  //   },
  //   {
  //     "image": ImagePage.avatar,
  //     "text": "Albert Flores",
  //     "text1": "1901 Thornridge Cir. Shiloh, Hawaii",
  //     "image2": ImagePage.deleteicon,
  //     "image3": ImagePage.pencil,
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPage.primarycolor,
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => AddUserPage()));

        },
        child: Icon(
          Icons.add,
          color: ColorPage.white,
        ),
      ),
      backgroundColor: ColorPage.white,
      appBar: AppBar(
        title: Text(
          "Hello, User",
          style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.w500),
        ),
        backgroundColor: ColorPage.white,
        actions: [
          InkWell(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));

          },
            child: CircleAvatar(
              child: Image.asset(ImagePage.profilephoto),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.03, right: width * 0.04),
            child: InkWell(
                onTap: () {
                  GoogleSignIn().signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                      (route) => false);
                  setState(() {});
                },
                child: Icon(
                  Icons.logout,
                  size: width * 0.1,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
              left: width * 0.03, right: width * 0.03, top: width * 0.07),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Current Users",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: width * 0.05)),
                ],
              ),
              SizedBox(
                height: width * 0.05,
              ),
              // StreamBuilder<DocumentSnapshot<Map<String,dynamic>>>(
              //     stream: FirebaseFirestore.instance.collection("users").doc("kdPUn6pyisyIhaL7ZYTZ").snapshots(),
              //     builder:(context, snapshot) {
              //       if(!snapshot.hasData){
              //         return Center(child: CircularProgressIndicator());
              //       }
              //       var data=snapshot.data!.data();
              //       return Column(
              //         children: [
              //           Text(data!["name"]),
              //           Text(data!["email"]),
              //         ],
              //       );
              //     }, ),

              Container(
                height: height * 1,
                child: StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
                  stream: FirebaseFirestore.instance.collection("users").snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return Center(
                        child: CircularProgressIndicator(

                        ),
                      );
                    }
                    var data=snapshot.data!.docs;
                    return ListView.separated(
                      shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Get(id: data[index].id,),));
                          },
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              tileColor: ColorPage.lightblue,
                              leading: CircleAvatar(
                                radius: width*0.08,
                                  backgroundImage: NetworkImage(data[index]["image"])),
                              title: Text(
                                data[index]["name"],
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.w500,
                                    color: ColorPage.black),
                              ),
                              subtitle: Text(
                                data[index]["email"],
                                style: TextStyle(fontSize: width * 0.026),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return CupertinoAlertDialog(
                                              title: Text("Are you Sure\n"
                                                  "You Want to delete User ?"),
                                              actions: [
                                                Column(
                                                  children: [
                                                    CupertinoDialogAction(
                                                      onPressed: () {
                                                        FirebaseFirestore.instance.collection("users").doc(data[index]["id"]).delete();
                                                        Navigator.pop(context);
                                                      },
                                                        child: Text(
                                                      "Yes",
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                      ),
                                                    ),
                                                    ),
                                                    Divider(),
                                                    CupertinoDialogAction(
                                                        child: Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          color: Colors.blue),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    )
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Container(child: SvgPicture.asset(ImagePage.deleteicon))
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  InkWell(  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditUserPage(
                                      id: data[index]["id"],
                                      name: data[index]["name"],
                                      email: data[index]["email"],
                                      password: data[index]["password"],
                                      image: data[index]["image"],
                                    ),));
                                  },
                                    child: Container(
                                      child: SvgPicture.asset(
                                        ImagePage.pencil,
                                        // color: ColorPage.primarycolor,
                                        width: width * 0.07,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: width * 0.03,
                          );
                        },
                        itemCount: data.length);
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
