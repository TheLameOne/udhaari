import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:udhaari/custom/CustomTextField.dart';
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
            CustomTextField(
              inputType: TextInputType.name,
              obscureText: false,
              name: "Name",
              controller: nameFieldContoller,
              prefixIcon: Icons.person,
              onChanged: (value) {
                name = value!;
              },
            ),
            // person search drop down list

            CustomTextField(
              inputType: TextInputType.number,
              obscureText: false,
              name: "Amount",
              controller: amountFieldContoller,
              prefixIcon: Icons.currency_rupee,
              onChanged: (value) {
                amount = value as double;
              },
            ),

            // description

            CustomTextField(
              inputType: TextInputType.text,
              obscureText: false,
              name: "Description",
              controller: descriptionFieldContoller,
              prefixIcon: Icons.description,
              onChanged: (value) {
                description = value!;
              },
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
