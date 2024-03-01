import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:udhaari/custom/PersonActivity.dart';
import 'package:udhaari/utils/global.dart';
import '';

class ViewPerson extends StatefulWidget {
  String name;
  String address;
  int netamount;
  String imageUrl;

  ViewPerson(
      {required this.name,
      required this.address,
      required this.netamount,
      required this.imageUrl});
  @override
  State<ViewPerson> createState() => _ViewPersonState();
}

class _ViewPersonState extends State<ViewPerson> {
  // var personName;
  // @override
  // void initState() {
  //   super.initState();
  //   personName = widget.name;
  // }

  // final personsStream = FirebaseFirestore.instance
  //     .collection("users")
  //     .doc(phoneNumber)
  //     .collection('activity')
  //     .where("personName", isEqualTo: 'harsh')
  //     .snapshots();

  final ScrollController _scrollViewController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollViewController,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: size.height * 0.1,
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 64),
                child: Row(children: []),
              ),
              color: Colors.green,
            )),
          ),
          SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Container(
                  height: 128,
                  width: 128,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: (widget.imageUrl.isNotEmpty)
                          ? NetworkImage(widget.imageUrl)
                          : AssetImage('assets/images/profilepic.png')
                              as ImageProvider,
                    ),
                  ),
                ),
                Text(widget.name),
                Row(
                  children: [
                    Text("You owe this"),
                    Text(widget.netamount.toString())
                  ],
                ),
                // List of Activity
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(phoneNumber)
                        .collection('activity')
                        .where("personName", isEqualTo: widget.name)
                        .orderBy('date', descending: true)
                        .snapshots(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data!.size);
                        return Column(children: [
                          for (int i = 0; i < snapshot.data!.size; i++)
                            PersonActivity(
                                description: snapshot.data?.docs[i]
                                    ['description'],
                                date: snapshot.data?.docs[i]['date'].toDate(),
                                amount: snapshot.data?.docs[i]['amount'],
                                imageUrl: snapshot.data?.docs[i]['imageURL']),
                        ]);
                      } else if (snapshot.hasError) {
                        print("error 2");
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        print("Error 3");
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ]))
        ],
      ),
    );
  }
}
