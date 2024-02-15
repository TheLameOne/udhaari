import 'package:flutter/material.dart';

class ViewPerson extends StatefulWidget {
  const ViewPerson({super.key});

  @override
  State<ViewPerson> createState() => _ViewPersonState();
}

class _ViewPersonState extends State<ViewPerson> {
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
              color: Colors.green,
            )),
          )
        ],
      ),
    );
  }
}
