import 'package:flutter/material.dart';

class AddPerson extends StatefulWidget {
  const AddPerson({super.key});

  @override
  State<AddPerson> createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Person"),
      ),
      body: Container(
        child: Column(
          children: [
            // Name*
            TextField(
              decoration: InputDecoration(
                labelText: "Name*",
                hintText: "Enter the name of the person",
              ),
            ),
            // Details
            TextField(
                decoration: InputDecoration(
              labelText: "Address",
              hintText: "Enter the address of the person",
            )),
            TextField(
              decoration: InputDecoration(
                labelText: "Photo",
                hintText: "Upload a photo of the person",
              ),
            ),
            // Address

            // Photo
            TextField(
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
