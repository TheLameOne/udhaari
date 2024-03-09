import 'package:flutter/material.dart';
import 'package:udhaari/utils/global.dart';

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
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.circular(8)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
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
                  Text(widget.description.toCapitalized(),
                      style: TextStyle(color: Colors.black87)),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(children: [
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
                            style: TextStyle(
                                color: Colors.green, fontFamily: 'Roboto'),
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
                            style: TextStyle(
                                color: Colors.orange, fontFamily: 'Roboto'),
                          ),
                        ],
                      ),
              ]),
              SizedBox(width: 4)
            ],
          ),
        ]),
      ),
    );
  }
}
