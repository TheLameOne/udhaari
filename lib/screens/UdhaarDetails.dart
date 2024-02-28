import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:udhaari/utils/global.dart';

class UdhaarDetails extends StatefulWidget {
  final String id;
  UdhaarDetails({required this.id});

  @override
  State<UdhaarDetails> createState() => _UdhaarDetailsState();
}

class _UdhaarDetailsState extends State<UdhaarDetails> {
  final now = DateTime.now();
  double amount = 100;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id + 'ID');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Row(children: [
          // Add a comment text field
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Add comment',
                suffixIcon: InkWell(onTap: () {}, child: Icon(Icons.send)),
              ),
            ),
          ),
        ]),
        appBar: AppBar(actions: const [
          Icon(Icons.camera_alt_outlined),
          Icon(Icons.delete),
          Icon(Icons.edit)
        ]),
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(phoneNumber)
                .collection('activity')
                .doc(widget.id)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var output = snapshot.data!;
                var value = output.data();
                // snapshot.data?.docs[i]['personName']
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(value!['personName'].toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(
                        value['amount'].toString(),
                        // add text Styling here
                        style: TextStyle(fontSize: 15, color: Colors.red),
                      ),
                      Text(numberToWords(amount).toString()),
                      Text(value['date'].toDate().toString()),
                      Text(value['description'].toString())
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
            }));
  }
}

numberToWords(double amount) {
  return 0;
}
