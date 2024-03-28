import 'dart:convert';

import 'package:crud/colorpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class APLPage extends StatefulWidget {
  const APLPage({super.key});

  @override
  State<APLPage> createState() => _APLPageState();
}

class _APLPageState extends State<APLPage> {

  List listview = [
    {"list": "Postoffice : Perinthalmanna", "list1": "Pincode : 679322"},
    {"list": "Postoffice : Perinthalmanna", "list1": "Pincode : 679322"},
    {"list": "Postoffice : Perinthalmanna", "list1": "Pincode : 679322"},
    {"list": "Postoffice : Perinthalmanna", "list1": "Pincode : 679322"},
    {"list": "Postoffice : Perinthalmanna", "list1": "Pincode : 679322"},
    {"list": "Postoffice : Perinthalmanna", "list1": "Pincode : 679322"},
    {"list": "Postoffice : Perinthalmanna", "list1": "Pincode : 679322"},
    {"list": "Postoffice : Perinthalmanna", "list1": "Pincode : 679322"},
    {"list": "Postoffice : Perinthalmanna", "list1": "Pincode : 679322"},
  ];

  String Link = "https://reqres.in/api/users?page=2";

  http.Response? a;

  Map<String,dynamic> data={

  };

  List users=[];

  getApiData() async {
    // String b="10";
    // int c=int.parse(b);
    // String b="10";
    // int c=int.tryParse(b)??0;

    a = await http.get(Uri.tryParse(Link)!);
    print(a!.statusCode);
    // print(a!.body);
    data=json.decode(a!.body);
    // print(data);

    if(a != null){
      users=data["data"];
      print(users);
      setState(() {

      });
    }
  }

  @override
  void initState() {

    getApiData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Postal Codes",
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
      backgroundColor: ColorPage.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(width * 0.03),
              child: SizedBox(
                height: width * 0.15,
                width: width * 0.95,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  cursorColor: ColorPage.black,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.blue,
                    ),
                    hintText: "Enter pincode",
                    filled: true,
                    fillColor: ColorPage.lightgray,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width * 0.03),
                        borderSide: BorderSide(color: ColorPage.lightgray)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorPage.lightgray),
                        borderRadius: BorderRadius.circular(width * 0.03)),
                  ),
                ),
              ),
            ),
            Container(
              height: width * 1.5,
              width: width * 1,
              // color: Colors.red,
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.03, right: width * 0.03),
                      child: ListTile(
                        tileColor: ColorPage.lightgray,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width * 0.03)),
                        title: Text(
                          "ID:${users[index]["id"]}",
                          style: TextStyle(
                              color: ColorPage.black,
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.04),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                             "Name: ${users[index]["first_name"]} ${users[index]["last_name"]}",
                              style: TextStyle(
                                  color: ColorPage.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * 0.04),
                            ),
                            Text(
                              "Email:${users[index]["email"]}",
                              style: TextStyle(
                                  color: ColorPage.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * 0.04),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: height * 0.02,
                    );
                  },
                  itemCount: users.length),
            )
          ],
        ),
      ),
    );
  }
}
