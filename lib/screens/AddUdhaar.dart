import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:udhaari/custom/CustomTextField.dart';
import 'package:udhaari/utils/global.dart';

class AddUdhaar extends StatefulWidget {
  const AddUdhaar({super.key});

  @override
  State<AddUdhaar> createState() => _AddUdhaarState();
}

class _AddUdhaarState extends State<AddUdhaar> {
  final nameFieldContoller = TextEditingController();
  final amountFieldContoller = TextEditingController();
  final descriptionFieldContoller = TextEditingController();

  DateTime selectedDate = DateTime.now();
  var name = '';
  var description = '';
  var numberToText = '';

  bool udhaar = false;
  var amount = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white38,
      appBar: AppBar(
        title: Text("Add Udhaar"),
        actions: [
          InkWell(
              onTap: () {
                if (name.isEmpty) {
                  print(name);
                  errorToast("Please Select Name", context);
                  return;
                }
                if (amount.isEmpty) {
                  errorToast("Please Enter Amount", context);
                  return;
                }
                if (description.isEmpty) {
                  errorToast("Please Enter Description", context);
                  return;
                }
                _addUdhaarToDatabase(name, amount, udhaar);
                // _addToActivity(name, amount, description, udhaar, selectedDate);

                // Submit form
                // success toast
                successToast("Added Successfully", context);
                Navigator.pop(context);
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
                amount = value!;
                print(amount.toString());
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
            InkWell(
                onTap: () => _selectDate(context),
                child: Icon(Icons.calendar_month)),

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

// void _addToActivity(String name, String amount, String description, bool udhaar,
//     DateTime selectedDate) {}

void _addUdhaarToDatabase(String name, String amount, bool udhaar) async {
  var collection = await FirebaseFirestore.instance
      .collection('users')
      .doc(phoneNumber)
      .collection('persons')
      .where("name", isEqualTo: name)
      .get();
  int netAmount = collection.docs[0].data()["netamount"];
  int totalAmount = netAmount + int.parse(amount);

  FirebaseFirestore.instance
      .collection('users')
      .doc(phoneNumber)
      .collection('persons')
      .doc(collection.docs[0].id)
      .update({'netamount': totalAmount});
}
