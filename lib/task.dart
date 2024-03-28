import 'dart:core';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/stock.dart';
import 'package:crud/task_page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'imagepage.dart';
import 'main.dart';

class Cart_Task extends StatefulWidget {
  const Cart_Task({super.key});

  @override
  State<Cart_Task> createState() => _Cart_TaskState();
}

class _Cart_TaskState extends State<Cart_Task> {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController fruit = TextEditingController();
  TextEditingController stock = TextEditingController();
  List Dropitems = [
    "Fruits",
    "vegetable",
    "grocery",
  ];
  String? selectedvalue;
  Map<String,dynamic>A={

  };
  File? file;
  picimage(ImageSource source) async {
    final pickedFile = await ImagePicker.platform.getImageFromSource(source: source);
    file=File(pickedFile!.path);
    if(mounted){
      file=File(pickedFile!.path);
      setState(() {

      });
    }
  }
List Sublist=[];
List stockout=[];

  @override
  // void initState() {
  //   demo();
  //   // TODO: implement initState
  //   super.initState();
  // }
  // demo() async {
  //  DocumentReference doc=FirebaseFirestore.instance.collection("add").doc("hello");
  // await doc.set({
  //   "name":"mashhoor",
  //   "id":doc.id
  // });
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(
              right: width * 0.1, left: width * 0.1, top: width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                    labelText: "Product name",
                    labelStyle: TextStyle(color: Colors.black),
                    // suffixIcon:Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Container(
                    //       child: SvgPicture.asset(
                    //         ImagePage.pencil,
                    //         // color: ColorPage.primarycolor,
                    //         width: width * 0.07,
                    //       ),
                    //     ),
                    //     InkWell(
                    //         onTap: () {
                    //           showDialog(
                    //             context: context,
                    //             builder: (context) {
                    //               return CupertinoAlertDialog(
                    //                 title: Text("Are you Sure\n"
                    //                     "You Want to delete User ?"),
                    //                 actions: [
                    //                   Column(
                    //                     children: [
                    //                       CupertinoDialogAction(
                    //                         onPressed: () {
                    //                           // FirebaseFirestore.instance.collection("users").doc(data[index]["id"]).delete();
                    //                           Navigator.pop(context);
                    //                         },
                    //                         child: Text(
                    //                           "Yes",
                    //                           style: TextStyle(
                    //                             color: Colors.red,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                       Divider(),
                    //                       CupertinoDialogAction(
                    //                         child: Text(
                    //                           "Cancel",
                    //                           style: TextStyle(
                    //                               color: Colors.blue),
                    //                         ),
                    //                         onPressed: () {
                    //                           Navigator.pop(context);
                    //                         },
                    //                       )
                    //                     ],
                    //                   ),
                    //                 ],
                    //               );
                    //             },
                    //           );
                    //         },
                    //         child: Container(
                    //           child: SvgPicture.asset(ImagePage.deleteicon),)
                    //     ),
                    //     SizedBox(width: width*0.03,)
                    //   ],
                    // ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * 0.03),
                    )),
                keyboardType: TextInputType.name,
              ),
              TextFormField(
                controller: price,
                decoration: InputDecoration(
                    labelText: "Price",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * 0.03),
                    )),
                keyboardType: TextInputType.number,
              ),
              DropdownButton(
                items: Dropitems.map((values) {
                  return DropdownMenuItem(
                    value: values,
                    child: Text(values),
                  );
                }).toList(),
                value: selectedvalue,
                hint: const Text("items"),
                onChanged: (value) {
                  selectedvalue = value.toString();
                  setState(() {});
                },
              ),
              TextFormField(
                controller: stock,
                decoration: InputDecoration(
                    labelText: "stock",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * 0.03),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * 0.03),
                    )),
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(onTap: () {
                    picimage(ImageSource.camera);
                  },
                    child: Container(
                      height: width*0.1,
                      width: width*0.1,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3H00mTC5uVdeXKgOOOz75dS2wMcnMYuhG7A&usqp=CAU"),fit:BoxFit.fill),
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10)),

                    ),
                  ),
                  InkWell(
                    onTap: () {
                      picimage(ImageSource.gallery);
                    },
                    child: Container(
                      height: width*0.1,
                      width: width*0.1,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUyxoOeoO7xWA4oxqrtEcK7QBBKAz8QsL1MQ&usqp=CAU"),fit: BoxFit.fill),
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )

                ],
              ),
              file==null ? Container(
                height:width*0.4,
                width:width*0.4,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)
                ),
              ):
              Container(
                height: width*0.4,
                width: width*0.4,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    image: DecorationImage(image: FileImage(file!),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              InkWell(
                onTap: () {
                  if(
                  name.text.isNotEmpty&&
                  price.text.isNotEmpty&&
                  stock.text.isNotEmpty
                      &&
                  selectedvalue!=""
                  ){
                    if(int.parse(stock.text)>0)
                    Sublist.add({
                      "name":name.text,
                      "price":price.text,
                      "stock":stock.text,
                      "image":file,
                      "items":selectedvalue

                    });
                    else{
                        stockout.add({
                        "name":name.text,
                        "price":price.text,
                        "stock":"0",
                        "image":file,
                          "items":selectedvalue
                                                                 
                        });
                        }


                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Task_Page2(sub1: Sublist, stockout1: stockout,
                            // name: name.text,
                            // price: price.text,
                            // stock: stock.text
                          ),
                        ));

                  }
                },
                child: Container(
                  height: height * 0.06,
                  width: width * 0.4,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(width * 0.03),
                      border: Border.all(color: Colors.black)),
                  child: Center(child: Text("Submit")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
