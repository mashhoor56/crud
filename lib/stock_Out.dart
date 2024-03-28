import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Stock_Out extends StatefulWidget {
  final List stockout2;
  const Stock_Out({super.key, required this.stockout2});

  @override
  State<Stock_Out> createState() => _Stock_OutState();
}

class _Stock_OutState extends State<Stock_Out> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          Container(
            height: height,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return
                    ListTile(
                      tileColor: Colors.grey.shade200,
                      // trailing: ,
                      title:Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.stockout2[index]["name"]),
                              Text(widget.stockout2[index]["stock"]),
                              Text(widget.stockout2[index]["items"])
                            ],
                          ),
                        ],
                      ),
                      leading:CircleAvatar(
                        radius: width*0.10,
                        backgroundImage: FileImage(widget.stockout2[index]["image"]),
                      ),
                      subtitle: Text("RS:${widget.stockout2[index]["price"]}"),
                    );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: width*0.1,);
                },
                itemCount:widget.stockout2.length),

          )

        ],
      ),
    );
  }
}
