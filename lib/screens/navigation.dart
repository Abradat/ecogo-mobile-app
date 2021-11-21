import 'dart:developer';

import 'package:ecogo_mobile_app/data/navigation/destination.dart';
import 'package:ecogo_mobile_app/widgets/common/stepper_card.dart';
import 'package:ecogo_mobile_app/widgets/map.dart';
import 'package:ecogo_mobile_app/widgets/navigation/directions_card.dart';
import 'package:ecogo_mobile_app/widgets/navigation/navigation_prompt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  final Destination destination;
  const NavigationScreen({Key? key, required this.destination})
      : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  bool navigationStarted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Map(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                if (navigationStarted) SafeArea(child: DirectionsCard()),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                if (navigationStarted)
                  Container(
                    child: StepperCard(),
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                NavigationPrompt(
                  startClicked: () {
                    setState(() {
                      navigationStarted = true;
                    });
                  },
                  stopClicked: () {
                    setState(() {
                      navigationStarted = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}