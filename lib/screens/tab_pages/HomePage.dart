import 'package:flutter/material.dart';
import 'package:udhaari/custom/PersonListView.dart';
import 'package:udhaari/screens/AddPerson.dart';
import 'package:udhaari/screens/AddUdhaar.dart';
import 'package:udhaari/screens/ViewPerson.dart';

class HomePage extends StatefulWidget {
  static const String routeNamed = "HomeScreen";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double overall_own = 100;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                // Search Function
              },
              child: Icon(Icons.search)),
          InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPerson(),
                  )),
              child: Icon(Icons.person_add_alt_1))
        ],
        title: Text("Udhaari"),
      ),
      floatingActionButton: SizedBox(
        width: size.width * 0.4,
        child: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddUdhaar())),
          foregroundColor: Colors.white,
          backgroundColor: Colors.cyan,
          child: Row(
            children: [Icon(Icons.receipt_rounded), Text("Add expense")],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            // Overall Own
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    // Navigate to Stats Screen
                  },
                  child: Row(
                    children: [
                      (overall_own > 0)
                          ? Text("Overall, you are owned")
                          : Text("Overall,you owe"),
                      Text("₹" + overall_own.toStringAsFixed(0),
                          style: TextStyle(
                              color:
                                  overall_own > 0 ? Colors.green : Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Icon(Icons.tune_rounded)
              ],
            ),
            // List view of persons
            InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewPerson(),
                    )),
                child: PersonListView()),
            // Floating Button in bottom right corner with text "Add Exprense"
          ]),
        ),
      ),
    );
  }
}
