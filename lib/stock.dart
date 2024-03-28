import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import 'main.dart';

class Stock extends StatefulWidget {
  final List sunb2;

  const Stock({super.key, required this.sunb2,    });

  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  // get doNothing=> null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(
  children: [
    Container(
      height: height,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return
                Column(
                  children: [
                    // Slidable(
                    //   key: UniqueKey(),
                    //   startActionPane: ActionPane(
                    //       motion: ScrollMotion(),
                    //       dismissible: DismissiblePane(onDismissed: () {}),
                    //       children: [
                    //         SlidableAction(
                    //           borderRadius: BorderRadius.circular(width*0.09),
                    //
                    //
                    //           onPressed: doNothing,
                    //           // backgroundColor:colorpage.secondarycolor,
                    //           foregroundColor:Colors.white,
                    //           icon: Icons.camera_alt_outlined,
                    //
                    //         ),
                    //         SlidableAction(
                    //           borderRadius: BorderRadius.circular(width*0.09),
                    //           onPressed: doNothing,
                    //           backgroundColor: Colors.white,
                    //           foregroundColor:Colors.black,
                    //           icon: Icons.call,
                    //
                    //         ),
                    //         SlidableAction(
                    //           borderRadius: BorderRadius.circular(width*0.09),
                    //           onPressed: doNothing,
                    //           backgroundColor:Colors.white,
                    //           foregroundColor: Colors.black,
                    //           icon: Icons.videocam,
                    //
                    //         ),
                    //       ]),
                    //   endActionPane: ActionPane(
                    //       motion: ScrollMotion(),
                    //       dismissible: DismissiblePane(onDismissed: () {}),
                    //       children: [
                    //         // SlidableAction(
                    //         //   borderRadius: BorderRadius.circular(width*0.09),
                    //         //
                    //         //
                    //         //   onPressed: doNothing,
                    //         //   backgroundColor: Colors.white,
                    //         //   foregroundColor: Colors.black,
                    //         //   icon:Icons.list_outlined,
                    //         //
                    //         // ),
                    //         // SlidableAction(
                    //         //   borderRadius: BorderRadius.circular(width*0.09),
                    //         //   onPressed: doNothing,
                    //         //   backgroundColor: Colors.white,
                    //         //   foregroundColor: Colors.black,
                    //         //   icon: CupertinoIcons.bell,
                    //         //
                    //         // ),
                    //         SlidableAction(
                    //           borderRadius: BorderRadius.circular(width*0.09),
                    //           onPressed: doNothing,
                    //           backgroundColor: Colors.redAccent,
                    //           foregroundColor: Colors.white,
                    //           icon: Icons.delete,
                    //
                    //         ),
                    //       ]), child: Text("ashik"),),
                    ListTile(
                      tileColor: Colors.grey.shade200,
                      // trailing: ,
                      title:Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.sunb2[index]["name"]),
                              Text(widget.sunb2[index]["stock"]),
                              Text(widget.sunb2[index]["items"])
                            ],
                          ),
                        ],
                      ),
                      leading:CircleAvatar(
                        radius: width*0.10,
                        backgroundImage: FileImage(widget.sunb2[index]["image"]),
                      ),
                      subtitle: Text("RS:${widget.sunb2[index]["price"]}"),
                    ),
                  ],
                );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: width*0.1,);
          },
          itemCount:widget.sunb2.length),

    ),

  ],
),
    );
  }
}
