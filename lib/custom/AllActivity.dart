import 'package:flutter/material.dart';

class AllActivity extends StatefulWidget {
  String description;
  DateTime date;
  int amount;
  String imageUrl;
  String name;

  AllActivity(
      {required this.description,
      required this.date,
      required this.amount,
      required this.imageUrl,
      required this.name});

  @override
  State<AllActivity> createState() => _AllActivityState();
}

class _AllActivityState extends State<AllActivity> {
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Column(
              children: [
                Text(months[widget.date.month]),
                Text(widget.date.day.toString())
              ],
            ),
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: (widget.imageUrl.isNotEmpty)
                      ? NetworkImage(widget.imageUrl)
                      : AssetImage('assets/images/profilepic.png')
                          as ImageProvider,
                ),
              ),
            ),
            Column(
              children: [
                Text(widget.name),
                Text(widget.description),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Text("you borrowed"),
            Text(widget.amount.toString()),
          ],
        )
      ]),
    );
  }
}
