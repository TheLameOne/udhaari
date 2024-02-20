import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:udhaari/custom/AllActivity.dart';
import 'package:udhaari/utils/global.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final fireStore = FirebaseFirestore.instance
      .collection("users")
      .doc(phoneNumber)
      .collection("activity")
      .orderBy('date', descending: true)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Activity")),
        body: StreamBuilder<QuerySnapshot>(
          stream: fireStore,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < snapshot.data!.size; i++)
                      AllActivity(
                        name: snapshot.data?.docs[i]['personName'],
                        amount: snapshot.data?.docs[i]['amount'],
                        date: snapshot.data?.docs[i]['date'].toDate(),
                        imageUrl: snapshot.data?.docs[i]['imageURL'],
                        description: snapshot.data?.docs[i]['description'],
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
