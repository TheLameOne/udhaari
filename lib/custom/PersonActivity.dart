import 'package:flutter/material.dart';

class PersonActivity extends StatefulWidget {
  String description;
  DateTime date;
  int amount;
  String imageUrl;

  PersonActivity(
      {required this.description,
      required this.date,
      required this.amount,
      required this.imageUrl});

  @override
  State<PersonActivity> createState() => _PersonActivityState();
}

class _PersonActivityState extends State<PersonActivity> {
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
            Text(widget.description),
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
