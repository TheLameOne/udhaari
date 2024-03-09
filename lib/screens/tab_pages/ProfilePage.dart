import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:udhaari/utils/global.dart';

class ProfilePage extends StatefulWidget {
  static const String routeNamed = "ProfilePage";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: HexColor('7CD5F7'),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: size.width * 0.9,
            height: size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile Pic
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Icon(
                      Icons.person,
                      size: 128,
                      color: HexColor('7CD5F7'),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Harsh Verma",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  phoneNumber,
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.52,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PROFILE",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.black),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.dark_mode,
                                  color: Colors.white,
                                ),
                              )),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Theme Mode",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Switch between Dark and Light Theme",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                      Switch(
                        value: false,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.amber),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.language_rounded,
                                  color: Colors.white,
                                ),
                              )),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Language",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Switch between English and Hindi",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                      Switch(
                        value: true,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                  // SizedBox(height: 20),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(25),
                  //               color: Colors.blueAccent),
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Icon(
                  //               Icons.wallet_giftcard,
                  //               color: Colors.white,
                  //             ),
                  //           )),
                  //       SizedBox(width: 8),
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "Refer & Earn",
                  //             style: TextStyle(
                  //                 color: Colors.black87,
                  //                 fontSize: 14,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //           Text(
                  //             "Refer to your friends and earn",
                  //             style: TextStyle(
                  //                 color: Colors.black45,
                  //                 fontSize: 12,
                  //                 fontWeight: FontWeight.bold),
                  //           )
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  // Row(
                  //   children: [
                  //     Container(
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(25),
                  //             color: Colors.greenAccent),
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Icon(
                  //             Icons.settings,
                  //             color: Colors.white,
                  //           ),
                  //         )),
                  //     SizedBox(width: 8),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           "Settings",
                  //           style: TextStyle(
                  //               color: Colors.black87,
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //         Text(
                  //           "Manage preferences",
                  //           style: TextStyle(
                  //               color: Colors.black45,
                  //               fontSize: 12,
                  //               fontWeight: FontWeight.bold),
                  //         )
                  //       ],
                  //     )
                  //   ],
                  // ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
