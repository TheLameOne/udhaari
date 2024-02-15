import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:udhaari/custom/CustomTextField.dart';

class AddUdhaar extends StatefulWidget {
  const AddUdhaar({super.key});

  @override
  State<AddUdhaar> createState() => _AddUdhaarState();
}

class _AddUdhaarState extends State<AddUdhaar> {
  final nameFieldContoller = TextEditingController();
  final amountFieldContoller = TextEditingController();
  final descriptionFieldContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var name = '';
    var description = '';
    var numberToText = '';
    bool udhaar = false;
    double amount = 0;

    return Scaffold(
      backgroundColor: Colors.white38,
      appBar: AppBar(
        title: Text("Add Udhaar"),
        actions: [
          InkWell(
              onTap: () {
                // Submit form
                // success toast
              },
              child: Icon(Icons.check))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            // person search drop down list
            Row(
              children: [
                Icon(Icons.person),
                //  text field for person search
                CustomTextField(
                  width: 256,
                  hintText: "Person Name",
                  // initialValue: "",
                  labelText: "Person Name",
                  onChanged: (value) {
                    name = value!;
                  },
                  textInputType: TextInputType.name,
                  controller: nameFieldContoller,
                ),
              ],
            ),
            // amount
            Row(
              children: [
                Icon(Icons.currency_rupee_sharp),
                CustomTextField(
                  width: 256,
                  hintText: "Amount",
                  // initialValue: "",
                  labelText: "Amount",
                  onChanged: (value) {
                    amount = value! as double;
                  },
                  textInputType: TextInputType.number,
                  controller: amountFieldContoller,
                ),
              ],
            ),
            // description
            Row(
              children: [
                Icon(Icons.currency_rupee_sharp),
                CustomTextField(
                  width: 256,
                  hintText: "Description",
                  // initialValue: "",
                  labelText: "Description",
                  onChanged: (value) {
                    description = value!;
                  },
                  textInputType: TextInputType.text,
                  controller: descriptionFieldContoller,
                ),
              ],
            ),
            // amount to text

            // red / green
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(color: Colors.red),
                    height: 50,
                    width: 100,
                    child: Text("Red"),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(color: Colors.green),
                    height: 50,
                    width: 100,
                    child: Text("Green"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
