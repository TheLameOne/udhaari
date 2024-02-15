import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:udhaari/utils/global.dart';

class AddPerson extends StatefulWidget {
  const AddPerson({super.key});

  @override
  State<AddPerson> createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final photoController = TextEditingController();
  final detailsController = TextEditingController();

  var name = '';
  var address = '';
  var photo = '';
  var details = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(phoneNumber)
                    .collection('persons')
                    // .where('phoneNumber', isEqualTo: phoneNumber)
                    .add({
                      //Data added in the form of a dictionary into the document.
                      'name': name,
                      'address': address,
                      'netamount': 0,
                    })
                    .then((value) => print("Data Added"))
                    .catchError((error) => print("Data not Added"));
              },
              child: Icon(Icons.check))
        ],
        title: Text("Add Person"),
      ),
      body: Container(
        child: Column(
          children: [
            // Name*
            TextField(
              onChanged: (value) {
                name = value;
              },
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name*",
                hintText: "Enter the name of the person",
              ),
            ),
            // Details
            TextField(
                controller: addressController,
                onChanged: (value) {
                  address = value;
                },
                decoration: InputDecoration(
                  labelText: "Address",
                  hintText: "Enter the address of the person",
                )),
            TextField(
              onChanged: (value) {
                photo = value;
              },
              controller: photoController,
              decoration: InputDecoration(
                labelText: "Photo",
                hintText: "Upload a photo of the person",
              ),
            ),
            // Address

            // Photo
            TextField(
              onChanged: (value) {
                details = value;
              },
              controller: detailsController,
              decoration: InputDecoration(
                labelText: "Details",
                hintText: "Enter the details of the person",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
