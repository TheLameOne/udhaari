import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:udhaari/custom/PersonListView.dart';
import 'package:udhaari/screens/AddPerson.dart';
import 'package:udhaari/screens/AddUdhaar.dart';
import 'package:udhaari/screens/ViewPerson.dart';
import 'package:udhaari/utils/global.dart';

class HomePage extends StatefulWidget {
  static const String routeNamed = "HomeScreen";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final overallOwnStream =
      FirebaseFirestore.instance.collection("users").snapshots();
  final personsStream = FirebaseFirestore.instance
      .collection("users")
      .doc(phoneNumber)
      .collection('persons')
      .orderBy('netamount', descending: true)
      .snapshots();

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
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                InkWell(
                  onTap: () {
                    // Navigate to Stats Screen
                  },
                  child: StreamBuilder<QuerySnapshot>(
                      stream: overallOwnStream,
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData) {
                          var overall_own =
                              snapshot.data?.docs[0]['overallOwn'];
                          return Row(children: [
                            (overall_own > 0)
                                ? Text("Overall, you are owned")
                                : Text("Overall,you owe"),
                            Text("₹" + overall_own.toStringAsFixed(0),
                                style: TextStyle(
                                    color: overall_own > 0
                                        ? Colors.green
                                        : Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ]);
                        } else if (snapshot.hasError) {
                          print("error 2");
                          return Center(child: Text(snapshot.error.toString()));
                        } else {
                          print("Error 3");
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
                Icon(Icons.tune_rounded),
              ]),
              StreamBuilder<QuerySnapshot>(
                  stream: personsStream,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          for (int i = 0; i < snapshot.data!.size; i++)
                            InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewPerson(
                                          name: snapshot.data?.docs[i]['name'],
                                          address: snapshot.data?.docs[i]
                                              ['address'],
                                          netamount: snapshot.data?.docs[i]
                                              ['netamount'],
                                          imageUrl: snapshot.data?.docs[i]
                                              ['imageURL']),
                                    )),
                                child: PersonListView(
                                  name: snapshot.data?.docs[i]['name'],
                                  address: snapshot.data?.docs[i]['address'],
                                  netamount: snapshot.data?.docs[i]
                                      ['netamount'],
                                  imageUrl: snapshot.data?.docs[i]['imageURL'],
                                )),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      print("error 2");
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      print("Error 3");
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })
            ]),
          ),
          // List view of persons

          // Floating Button in bottom right corner with text "Add Exprense"
        ));
  }
}

_overall(double overall_own) async {
  int overallOwn = 0;
  var collection = FirebaseFirestore.instance.collection('users');
  var querySnapshot = await collection.get();
  for (var queryDocumentSnapshot in querySnapshot.docs) {
    Map<String, dynamic> data = queryDocumentSnapshot.data();
    overallOwn = data['overallOwn'];
  }
  return overallOwn as double;
}
