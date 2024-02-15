import 'package:flutter/material.dart';

class PersonListView extends StatelessWidget {
  const PersonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // image widget with circle cutout like DP
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage('https://example.com/image.png'),
                ),
              ),
            ),
            Text("Jagmal")
          ],
        )

        // ownes
        ,
        Column(
          children: [Text("owes you"), Text("100")],
        )
      ],
    ));
  }
}
