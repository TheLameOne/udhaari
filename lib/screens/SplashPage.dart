import 'package:flutter/material.dart';
import 'package:udhaari/screens/UdhaarDetails.dart';
import 'package:udhaari/screens/tab_pages/ActivityPage.dart';
import 'package:udhaari/screens/tab_pages/AllPersons.dart';
import 'package:udhaari/screens/tab_pages/HomePage.dart';
import 'package:udhaari/utils/global.dart';

class SplashPage extends StatefulWidget {
  static const String routeNamed = "SplashPage";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _getBody() {
    switch (currentPage) {
      case 0:
        return HomePage();
      case 1:
        return AllPersonPage();
      case 2:
        return ActivityPage();
      case 3:
        return HomePage();
      // case 4:
      //   return ProfileScreen();
      default:
        return HomePage();
    }
  }

  _getBottomBar() {
    return Card(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _getBottomBarItem(index: 0, icontab: Icons.home),
          _getBottomBarItem(index: 1, icontab: Icons.groups_3_rounded),
          _getBottomBarItem(index: 2, icontab: Icons.bar_chart_rounded),
          _getBottomBarItem(index: 3, icontab: Icons.person),
        ],
      ),
    );
  }

  _getBottomBarItem({required int index, required IconData icontab}) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                currentPage = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: currentPage == index ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(icontab,
                          color:
                              currentPage == index ? Colors.amber : Colors.grey,
                          size: (28)),
                      SizedBox(height: 2),
                    ],
                  ),
                  // (currentPage == index) ? Container(margin:const EdgeInsets.only(left: 8) ,child: CustomText.smalltext(text)) : const Text('')
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _getBottomBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Expanded(child: _getBody())],
      ),
    );
  }
}
