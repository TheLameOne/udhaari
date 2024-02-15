import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

var currentPage = 0;
var phoneNumber = "8218124336";
void errorToast(String message, BuildContext context) {
  var fToast = FToast();
  fToast.init(context);
  fToast.showToast(
      child: customizedLeadingIconWidget(message), gravity: ToastGravity.TOP);
}

void successToast(String message, BuildContext context) {
  var fToast = FToast();
  fToast.init(context);
  fToast.showToast(
      child: successIconWidget(message), gravity: ToastGravity.TOP);
}

Widget customizedLeadingIconWidget(String message) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.black,
    ),
    child: Text(message,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
  );
}

Widget successIconWidget(String message) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Color.fromARGB(255, 18, 191, 222),
    ),
    child: Text(message,
        style: const TextStyle(color: Colors.white, fontSize: 16)),
  );
}
