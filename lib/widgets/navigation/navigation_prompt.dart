import 'dart:core';
import 'dart:developer';

import 'package:ecogo_mobile_app/data/navigation/destination.dart';
import 'package:ecogo_mobile_app/widgets/navigation/destination_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NavigationPrompt extends StatefulWidget {
  final double hfact = 0.8;
  final Function? startClicked;
  final Function? stopClicked;
  const NavigationPrompt({Key? key, this.startClicked, this.stopClicked})
      : super(key: key);

  @override
  _NavigationPromptState createState() => _NavigationPromptState();
}

class _NavigationPromptState extends State<NavigationPrompt> {
  bool started = false;
  int heightFactor = 3;
  Destination destination = Destination("Tim Hortons", "685 Great Northern Way",
      const LatLng(49.26290268543555, -123.0876085427132), 1000, 10);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: MediaQuery.of(context).size.height / heightFactor,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: !started
          ? Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              destination.name,
                              style: TextStyle(
                                  color: Color(0xFF555555),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              destination.address,
                              style: TextStyle(
                                color: Color(0xFF000000).withOpacity(0.6),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            color: Color(0xFFFFFFFF),
                            size: 25,
                          ),
                        ),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFBCBCBC),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: DestinationItem(
                      distance: 100.0, time: 22, score: 100, reward: 10),
                  margin: EdgeInsets.only(bottom: 20),
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 60),
                        primary: const Color(0xFF466BE4)),
                    onPressed: () {
                      setState(() {
                        if (!started) {
                          started = true;
                          widget.startClicked!();
                          heightFactor = 5;
                        } else {
                          started = false;
                          heightFactor = 3;
                        }
                      });
                    },
                    child: const Text(
                      "Start",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "23" + " min",
                  style: TextStyle(
                    color: Color(0xFF000000).withOpacity(0.6),
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text(
                          "1.9 Km",
                          style: TextStyle(
                            color: Color(0xFF000000).withOpacity(0.6),
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        "1:18 PM",
                        style: TextStyle(
                          color: Color(0xFF000000).withOpacity(0.6),
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    primary: const Color(0xFFDD6262),
                  ),
                  onPressed: () {
                    setState(() {
                      started = false;
                      heightFactor = 3;
                      widget.stopClicked!();
                    });
                  },
                  child: const Text(
                    "Stop Walking",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
