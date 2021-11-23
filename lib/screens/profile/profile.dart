import 'package:ecogo_mobile_app/screens/profile/friends.dart';
import 'package:ecogo_mobile_app/widgets/profile/badge.dart';
import 'package:ecogo_mobile_app/widgets/profile/control_button.dart';
import 'package:ecogo_mobile_app/widgets/profile/profile_overview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF2F2F2),
                  Color(0xFFDFDFDF),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const ControlButton(
                          icon: Icons.arrow_back,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/shop');
                        },
                        child: ControlButton(
                          icon: Icons.storefront,
                        ),
                      ),
                      ControlButton(
                        icon: Icons.settings,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage("assets/images/avatar_complete.png"),
                      ),
                      Column(
                        children: const [
                          Text(
                            "Joe Pesci",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Friend Code: 1290384",
                            style: TextStyle(
                              color: Color(0xFF8F8F8F),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: ListView(
                      children: [
                        // Friends Section
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Friends",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          backgroundColor: Colors.transparent,
                                          isScrollControlled: true,
                                          builder: (BuildContext context) {
                                            return FriendsBottomSheet();
                                          });
                                    },
                                    child: Text(
                                      "More",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    ProfileOverview(
                                      userCode: "10000",
                                      username: "Sachit",
                                      level: 20,
                                      image:
                                          "assets/images/profile/sample_profile_pic.png",
                                    ),
                                    ProfileOverview(
                                      userCode: "10000",
                                      username: "Sachit",
                                      level: 20,
                                      image:
                                          "assets/images/profile/sample_profile_pic.png",
                                    ),
                                    ProfileOverview(
                                      userCode: "10000",
                                      username: "Sachit",
                                      level: 20,
                                      image:
                                          "assets/images/profile/sample_profile_pic.png",
                                    ),
                                    ProfileOverview(
                                      userCode: "10000",
                                      username: "Sachit",
                                      level: 20,
                                      image:
                                          "assets/images/profile/sample_profile_pic.png",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 10,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),

                        // Achievements Section
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Achievements",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "More",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: const [
                                        Text(
                                          "2312",
                                          style: TextStyle(
                                            color: Color(0xFF29CE6B),
                                            fontSize: 28,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Daily Steps",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        const Divider(
                          height: 10,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),

                        // Badges Section
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Badges",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "More",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Badge(
                                    locked: false,
                                    image: "king.png",
                                    title: "Walking King",
                                    progress: 1000,
                                    required: 1000,
                                  ),
                                  Badge(
                                    locked: true,
                                    image: "king.png",
                                    title: "Walking Master",
                                    progress: 1000,
                                    required: 5000,
                                  ),
                                  Badge(
                                    locked: true,
                                    image: "king.png",
                                    title: "Challenger",
                                    progress: 1000,
                                    required: 10000,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
