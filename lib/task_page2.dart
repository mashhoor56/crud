import 'package:crud/main.dart';
import 'package:crud/stock.dart';
import 'package:crud/stock_Out.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task_Page2 extends StatefulWidget {

  final List sub1;
  final List stockout1;

  const Task_Page2({super.key, required this.sub1, required this.stockout1});

  @override
  State<Task_Page2> createState() => _Task_Page2State();
}

class _Task_Page2State extends State<Task_Page2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Stock( sunb2: widget.sub1,),));
                      },
                      child: Container(
                        height: height*0.1,
                        width: width*0.4,
                       decoration: BoxDecoration(
                           color: Colors.grey,
                         borderRadius: BorderRadius.circular(width*0.03)
                       ),
                        child: Center(child: Text("Stock",style: TextStyle(
                          color: Colors.white,
                          fontSize: width*0.05
                        ),)),
                      ),
                    ),

                  ],
                ),

                InkWell(onTap:
                  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Stock_Out(stockout2: widget.stockout1,),));
                  },
                  child: Container(
                    height: height*0.1,
                    width: width*0.4,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(width*0.03)
                    ),
                    child: Center(child: Text("Stock Out",style: TextStyle(
                      color: Colors.white,
                        fontSize: width*0.05
                    ),)),
                  ),
                ),
              ],
            ),

          ],
        ) ,
      ),
    );
  }
}
