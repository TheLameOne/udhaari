import 'dart:ffi';

import 'package:flutter/material.dart';

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
    return Container(
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
            Text(name)
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
                      Text(
                        netamount.toString(),
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  )
                : Column(
                    children: [
                      Text("you owe"),
                      Text(
                        netamount.abs().toString(),
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  )
      ],
    ));
  }
}
