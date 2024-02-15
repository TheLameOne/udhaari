import 'package:flutter/material.dart';

class UdhaarDetails extends StatefulWidget {
  const UdhaarDetails({super.key});

  @override
  State<UdhaarDetails> createState() => _UdhaarDetailsState();
}

class _UdhaarDetailsState extends State<UdhaarDetails> {
  final now = DateTime.now();
  double amount = 100;
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
      appBar: AppBar(actions: [
        Icon(Icons.camera_alt_outlined),
        Icon(Icons.delete),
        Icon(Icons.edit)
      ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Jagmal",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(
              "100",
              // add text Styling here
              style: TextStyle(fontSize: 15, color: Colors.red),
            ),
            Text(numberToWords(amount).toString()),
            Text(now.toString()),
            Text("Details")
          ],
        ),
      ),
    );
  }
}

numberToWords(double amount) {
  return 0;
}
