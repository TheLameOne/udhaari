import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:searchfield/searchfield.dart';
import 'package:udhaari/custom/CustomTextField.dart';
import 'package:udhaari/utils/global.dart';

class AddUdhaar extends StatefulWidget {
  List _searchList = [];

  @override
  State<AddUdhaar> createState() => _AddUdhaarState();
}

class _AddUdhaarState extends State<AddUdhaar> {
  @override
  void initState() {
    getSearchList();
    super.initState();
  }

  List _list = [];

  getSearchList() async {
    var data = await FirebaseFirestore.instance
        .collection('users')
        .doc(phoneNumber)
        .collection('persons')
        .get();

    setState(() {
      widget._searchList = data.docs;
    });
    for (int i = 0; i < widget._searchList.length; i++) {
      _list.add(widget._searchList[i]['name']);
    }
    print(_list);
  }

  final nameFieldContoller = TextEditingController();
  final amountFieldContoller = TextEditingController();
  final descriptionFieldContoller = TextEditingController();
  var photoPath = '';
  String imageURL = '';
  late Reference imagepath;
  XFile? filepath = null;

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
        firstDate: DateTime(1950),
        lastDate: DateTime.now());

    setState(() {
      selectedDate = picked!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Udhaar"),
        actions: [
          InkWell(
              onTap: () async {
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
                try {
                  await imagepath.putFile(File(filepath!.path));
                  print(filepath!.path);
                  imageURL = await imagepath.getDownloadURL();
                } catch (error) {
                  print(error.toString());
                }
                _addUdhaarToDatabase(name, amount);
                _overallOwn(amount);
                _addToActivity(
                    name, amount, description, udhaar, selectedDate, imageURL);

                // Submit form
                // success toast
                successToast("Added Successfully", context);
                Navigator.pop(context);
              },
              child: Icon(Icons.check))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 64, right: 64),
          child: Column(
            children: [
              // Container(
              //   height: size.height,
              //   width: size.width,
              //   child: ListView.builder(
              //       itemCount: _searchList.length,
              //       itemBuilder: (context, index) {
              //         return ListTile(
              //           title: Text(_searchList[index]['name']),
              //         );
              //       }),
              // ),
              Container(
                // decoration: InputDecoration(
                //   prefixIcon: Icon(prefixIcon),
                //   isDense: true,
                //   labelText: name,
                //   counterText: "",
                //   labelStyle: const TextStyle(color: Colors.grey),
                //   border: const OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.green),
                //     borderRadius: BorderRadius.all(Radius.circular(10)),
                //   ),
                //   focusedBorder: const OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.green),
                //     borderRadius: BorderRadius.all(Radius.circular(10)),
                //   ),
                //   enabledBorder: const OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.green),
                //     borderRadius: BorderRadius.all(Radius.circular(10)),
                //   ),
                // ),

                child: SearchField<String>(
                  controller: nameFieldContoller,
                  onSubmit: (p0) {
                    name = p0;
                    print(name.toString());
                  },
                  searchInputDecoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: (name != null) ? "Name" : " ",
                    counterText: "",
                    labelStyle: const TextStyle(color: Colors.grey),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  suggestions: _list
                      .map(
                        (e) => SearchFieldListItem<String>(
                          e,
                          item: e,
                          // Use child to show Custom Widgets in the suggestions
                          // defaults to Text widget
                          child: Container(
                            height: 100,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    child: Icon(Icons.person),
                                    width: 10,
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    e,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              // CustomTextField(
              //   inputType: TextInputType.name,
              //   obscureText: false,
              //   name: "Name",
              //   controller: nameFieldContoller,
              //   prefixIcon: Icons.person,
              //   onChanged: (value) {
              //     name = value!;
              //   },
              // ),
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
              InkWell(
                onTap: () async {
                  ImagePicker imagePicker = ImagePicker();
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.gallery);

                  if (file != null) {
                    String id =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages =
                        referenceRoot.child(phoneNumber.toString());
                    Reference referenceImageToUpload =
                        referenceDirImages.child(id);
                    imagepath = referenceImageToUpload;
                    filepath = file;
                  } else {
                    errorToast("Please Choose the File", context);
                  }
                },
                child: Icon(Icons.camera),
              ),

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
      ),
    );
  }
}

void _overallOwn(String amount) {
  FirebaseFirestore.instance
      .collection('users')
      .doc(phoneNumber)
      .update({'overallOwn': FieldValue.increment(int.parse(amount))});
}

void _addToActivity(String name, String amount, String description, bool udhaar,
    DateTime selectedDate, String imageURL) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(phoneNumber)
      .collection('activity')
      .add({
    'personName': name,
    'amount': int.parse(amount),
    'udhaar': udhaar,
    'date': selectedDate,
    'description': description,
    'imageURL': imageURL
  });
}

void _addUdhaarToDatabase(String name, String amount) async {
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
