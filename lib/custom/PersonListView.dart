import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:udhaari/utils/global.dart';

class PersonListView extends StatelessWidget {
  String name;
  String address;
  int netamount;
  String imageUrl;

  PersonListView(
      {required this.name,
      required this.address,
      required this.netamount,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // image widget with circle cutout like DP
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: (imageUrl.isNotEmpty)
                        ? NetworkImage(imageUrl)
                        : AssetImage('assets/images/profilepic.png')
                            as ImageProvider,
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                name.toTitleCase(),
                style: TextStyle(fontSize: 16),
              )
            ],
          ),

          // ownes
          (netamount == 0)
              ? Text(
                  "Settled up",
                  style: TextStyle(color: Colors.grey),
                )
              : (netamount > 0)
                  ? Column(
                      children: [
                        Text("owes you"),
                        Row(
                          children: [
                            Text("₹",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    color: Colors.green)),
                            Text(
                              netamount.toString(),
                              style:
                                  TextStyle(color: Colors.green, fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Text("you owe"),
                        Row(
                          children: [
                            Text("₹",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    color: Colors.orange)),
                            Text(
                              netamount.abs().toString(),
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    )
        ],
      )),
    );
  }
}
