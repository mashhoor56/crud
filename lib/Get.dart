import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colorpage.dart';
import 'main.dart';

class Get extends StatefulWidget {
  final String id;

  const Get({super.key, required this.id});

  @override
  State<Get> createState() => _GetState();
}

class _GetState extends State<Get> {
  List getcollection = [];
  Map<String,dynamic> getdocument={};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: InkWell(
                onTap: () async {
                  QuerySnapshot<Map<String, dynamic>> getdata =
                      await FirebaseFirestore.instance.collection("users").get();
                  getcollection = getdata.docs;

                  DocumentSnapshot<Map<String,dynamic>> docdata=
                  await FirebaseFirestore.instance.collection("users").doc(widget.id).get();
                  getdocument=docdata.data()!;

                  setState(() {

                  });
                },
                child: CircleAvatar(
                  radius: width * 0.1,
                  backgroundColor: Colors.grey,
                  child: Text(
                    "Get",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              height: width*0.2,
              width: width*0.8,
              decoration: BoxDecoration(
                  color: ColorPage.primarycolor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(getdocument["name"] ?? "",style: TextStyle(color: ColorPage.white),),
                   Text(getdocument["email"] ?? "",style: TextStyle(color: ColorPage.white)),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(right: width*0.04,left: width*0.04),
              child: Container(
                height: height*0.7,
                // color: Colors.blue,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            tileColor: ColorPage.lightblue,
                            title: Text(getcollection[index]["name"]),
                            subtitle: Text(getcollection[index]["email"]),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: width*0.02,
                      );
                    },
                    itemCount: getcollection.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}
