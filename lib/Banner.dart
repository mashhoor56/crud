import 'package:crud/OTP.dart';
import 'package:crud/colorpage.dart';
import 'package:crud/imagepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({super.key});

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {

  List A=[
    {
      "Image": ImagePage.book,
    "Image1":ImagePage.delete,
      "text":"Banner 1",
      "text2":"2 May"
    },
    {
      "Image": ImagePage.camera,
    "Image1":ImagePage.delete,
      "text":"Banner 2",
      "text2":"2 May"
    },
    {
      "Image": ImagePage.book,
    "Image1":ImagePage.delete,
      "text":"Banner 3",
      "text2":"2 May"
    },


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPage.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Banner",
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
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: height*1,
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: width*0.05,right: width*0.05,),
                    child: Container(
                      height: width*0.9,
                      // color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(ImagePage.frame),
                          TextFormField(

                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: ColorPage.primarycolor),
                              labelText: "   Title   ",
                              labelStyle: TextStyle(color: ColorPage.primarycolor),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(width * 0.03),
                                  borderSide:
                                  BorderSide(color: ColorPage.primarycolor,
                                  width: width*0.004)),
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
                  InkWell(onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => OTP(),));
                  },
                    child: Container(
                      height: width*0.12,
                      width: width*0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        border: Border.all(color: ColorPage.primarycolor,width: width*0.004)
                      ),
                      child: Center(
                        child: Text("Upload Banner",
                        style: TextStyle(fontWeight: FontWeight.w500,
                        color: ColorPage.primarycolor),),
                      ),
                    ),
                  ),
                  Container(
                    height: width*0.9,
                    width: width*1,
                    // color: Colors.blue,
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                        itemBuilder:(context, index) {
                         return Padding(
                           padding:  EdgeInsets.only(left: width*0.05,right: width*0.05,top: width*0.04),
                           child: Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(width*0.05),
                               color: ColorPage.white,
                               boxShadow: [
                                 BoxShadow(
                                   color: ColorPage.black.withOpacity(0.1),
                                   blurRadius: 1,
                                   spreadRadius: 0.1,
                                   offset: Offset(0, 4)
                                 )
                               ]
                             ),
                             child: ListTile(
                               // tileColor: ColorPage.lightgray,
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(width*0.03),
                               ),
                               leading: Image.asset(A[index]["Image"]),
                               title: Text(A[index]["text"],style: GoogleFonts.jacquesFrancois(color: Colors.blue),),
                               subtitle: Text(A[index]["text2"]),
                               trailing: InkWell(
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
                                                     child: Text(
                                                       "Yes",
                                                       style: TextStyle(
                                                         color: Colors.red,
                                                       ),
                                                     )),
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
                                   child: SvgPicture.asset(A[index]["Image1"])),
                             ),
                           ),
                         ) ;
                        } ,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: width*0.05,);
                        },
                        itemCount: A.length),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
