import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:udhaari/custom/CustomTextField.dart';
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
  var photoPath = '';
  var details = '';
  String imageURL = '';
  late Reference imagepath;
  XFile? filepath = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () async {
                if (name.isEmpty) {
                  errorToast("Please Enter Name", context);
                  return;
                }
                if (address.isEmpty) {
                  errorToast("Please Enter Address", context);
                  return;
                }
                try {
                  await imagepath.putFile(File(filepath!.path));
                  print(filepath!.path);
                  imageURL = await imagepath.getDownloadURL();
                } catch (error) {
                  print(error.toString());
                }
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
                      'imageURL': imageURL,
                    })
                    .then((value) => print("Data Added"))
                    .catchError((error) => print("Data not Added"));
                successToast("Person Added Successfully", context);
                Navigator.pop(context);
              },
              child: Icon(Icons.check))
        ],
        title: Text("Add Person"),
      ),
      body: Container(
        child: Column(
          children: [
            // Name*
            CustomTextField(
              inputType: TextInputType.name,
              obscureText: false,
              name: "Name",
              controller: nameController,
              prefixIcon: Icons.person,
              onChanged: (value) {
                name = value!;
              },
            ),
            // Details
            CustomTextField(
              inputType: TextInputType.streetAddress,
              obscureText: false,
              name: "Address",
              controller: addressController,
              prefixIcon: Icons.home,
              onChanged: (value) {
                address = value!;
              },
            ),

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
                child: Icon(Icons.camera_alt_rounded)),
            CustomTextField(
              inputType: TextInputType.text,
              obscureText: false,
              name: "Details",
              controller: detailsController,
              prefixIcon: Icons.description,
              onChanged: (value) {
                details = value!;
              },
            ),
          ],
        ),
      ),
    );
  }
}

void _validate(String name) {}
