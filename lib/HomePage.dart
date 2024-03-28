import 'package:carousel_slider/carousel_slider.dart';
import 'package:crud/API.dart';
import 'package:crud/Banner.dart';
import 'package:crud/homepage1.dart';
import 'package:crud/Login.dart';
import 'package:crud/Profile.dart';
import 'package:crud/colorpage.dart';
import 'package:crud/imagepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex=0;

  List images=[
    Image.asset(ImagePage.listview),
    Image.asset(ImagePage.listview),
    Image.asset(ImagePage.listview),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPage.white,
      appBar: AppBar(
        title: Text(
          "Hello, User",
          style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.w500),
        ),
        backgroundColor: ColorPage.white,
       actions: [
         InkWell( onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));

         },
           child: CircleAvatar(
             child: Image.asset(ImagePage.profilephoto),
           ),
         ),
         Padding(
           padding: EdgeInsets.only(left: width*0.03,right: width*0.04),
           child: InkWell(
               onTap: () async {
                 SharedPreferences prefs = await SharedPreferences.getInstance();
                 await prefs.remove('login');

                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(),), (route) => false);
                 setState(() {

                 });
               },
               child: Icon(Icons.logout,size: width*0.1,)),
         )
       ],
      ),
      body:Column(
        children: [
          CarouselSlider.builder(
              itemCount: images.length, 
              itemBuilder:(context, index, realIndex) {
                return Column(
                  children: [
                    Container(
                      height: width*0.5,
                      width: width*1,
                      decoration: BoxDecoration(
                        image: DecorationImage(image:AssetImage( ImagePage.listview))
                      ),
                    )
                  ],
                );
              }, 
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  currentindex=index;
                  setState(() {

                  });
                },
              )),
          AnimatedSmoothIndicator(
              activeIndex: currentindex,
              count: images.length,
            effect: JumpingDotEffect(
               dotHeight: width*0.03,
              dotWidth: width*0.03,
              activeDotColor: ColorPage.black,
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: width*0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => home_page1(),), (route) => false);
                },
                  child: Container(
                    height: width*0.4,
                    width: width*0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(ImagePage.yellowpaper,width: width*0.15,),
                        Text("CRUD",
                        style: TextStyle(fontWeight: FontWeight.w500),)
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: ColorPage.white,
                      borderRadius: BorderRadius.circular(width*0.1),
                      // image: DecorationImage(image: AssetImage(ImagePage.yellowpaper)),
                      boxShadow: [
                        BoxShadow(
                          color: ColorPage.black.withOpacity(0.05),
                          blurRadius: 7,
                          spreadRadius: 18,
                          offset: Offset(4, 0)
                        )
                      ]
                    ),
                  ),
                ),
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BannerPage(),));
                },
                  child: Container(
                    height: width*0.4,
                    width: width*0.4,
                    child: Column(
                      children: [
                        Image.asset(ImagePage.cloudstorage,width: width*0.33,),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: ColorPage.white,
                      borderRadius: BorderRadius.circular(width*0.1),
                      boxShadow: [
                        BoxShadow(
                          color: ColorPage.black.withOpacity(0.05),
                          blurRadius: 7,
                          spreadRadius: 18,
                          offset: Offset(4, 0)
                        )
                      ]
                    ),
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: width*0.07,top: width*0.1),
            child: Row(
              children: [
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => APLPage(),));
                },
                  child: Container(
                    height: width*0.4,
                    width: width*0.4,
                    child: Column(
                      children: [
                        Image.asset(ImagePage.API,width: width*0.28,),
                        Text("API ",
                          style: TextStyle(fontWeight: FontWeight.w500),)
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: ColorPage.white,
                        borderRadius: BorderRadius.circular(width*0.1),
                        boxShadow: [
                          BoxShadow(
                              color: ColorPage.black.withOpacity(0.05),
                              blurRadius: 7,
                              spreadRadius: 18,
                              offset: Offset(4, 0)
                          )
                        ]
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
