import 'dart:core';
import 'dart:developer';

import 'package:ecogo_mobile_app/data/navigation/destination.dart';
import 'package:ecogo_mobile_app/repository/destination/destination_repository.dart';
import 'package:ecogo_mobile_app/services/location_service.dart';
import 'package:ecogo_mobile_app/widgets/navigation/destination_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NavigationPrompt extends StatefulWidget {
  final double hfact = 0.8;
  final Function? startClicked;
  final Function? stopClicked;
  final Destination destination;
  const NavigationPrompt(
      {Key? key,
      this.startClicked,
      this.stopClicked,
      required this.destination})
      : super(key: key);

  @override
  _NavigationPromptState createState() => _NavigationPromptState();
}

class _NavigationPromptState extends State<NavigationPrompt> {
  final LocationService _locationService = LocationService();
  final DestinationRepository _destinationRepository = DestinationRepository();

  bool started = false;
  bool isCalculating = true;
  int heightFactor = 3;
  late Position _userLocation;
  late double _distance;
  late int _time;
  late int _score;
  late int _reward;
  bool calculated = false;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    _userLocation = await _locationService.determinePosition();
    setState(() {
      _distance = _locationService.coordinateDistance(
          _userLocation.latitude,
          _userLocation.longitude,
          widget.destination.location.latitude,
          widget.destination.location.longitude);
      _time = _locationService.calculateNavigationTime(_distance);
      _reward = _locationService.calculateReward(_distance);
      _score = _locationService.calculateScore(_distance);
      calculated = true;
    });
  }

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
                              widget.destination.name,
                              style: TextStyle(
                                  color: Color(0xFF555555),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              widget.destination.address,
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
                            if (!started) {
                              Navigator.pop(context);
                            }
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
                if (calculated)
                  Container(
                    child: DestinationItem(
                      score: _score,
                      reward: _reward,
                      time: _time,
                      distance: _distance,
                    ),
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
                          _destinationRepository
                              .saveRecentDestination(widget.destination);
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
