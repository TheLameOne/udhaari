import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:udhaari/custom/PersonListView.dart';
import 'package:udhaari/screens/AddUdhaar.dart';
import 'package:udhaari/utils/global.dart';

class AllPersonPage extends StatelessWidget {
  final fireStore = FirebaseFirestore.instance
      .collection("users")
      .doc(phoneNumber)
      .collection("persons")
      .snapshots();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          actions: [Icon(Icons.tune)],
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
        body: StreamBuilder<QuerySnapshot>(
          stream: fireStore,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < snapshot.data!.size; i++)
                      PersonListView(
                        name: snapshot.data?.docs[i]['name'],
                        address: snapshot.data?.docs[i]['address'],
                        netamount: snapshot.data?.docs[i]['netamount'],
                        imageUrl: snapshot.data?.docs[i]['imageURL'],
                      )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
