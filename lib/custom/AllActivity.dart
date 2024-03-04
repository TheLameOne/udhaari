import 'package:flutter/material.dart';
import 'package:udhaari/utils/global.dart';

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
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Text(months[widget.date.month - 1]),
                      Text(widget.date.day.toString())
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8),
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
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name.toTitleCase(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(widget.description,
                      style: TextStyle(color: Colors.black87)),
                ],
              ),
            ],
          ),
          (widget.amount > 0)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "you lent",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      "₹${widget.amount}",
                      style:
                          TextStyle(color: Colors.green, fontFamily: 'Roboto'),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "you borrowed",
                      style: TextStyle(color: Colors.orange),
                    ),
                    Text(
                      "₹${widget.amount.abs()}",
                      style:
                          TextStyle(color: Colors.orange, fontFamily: 'Roboto'),
                    ),
                  ],
                )
        ]),
      ),
    );
  }
}
