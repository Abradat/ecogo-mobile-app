import 'package:ecogo_mobile_app/data/info_card_direction.dart';
import 'package:ecogo_mobile_app/widgets/common/general_badge.dart';
import 'package:ecogo_mobile_app/widgets/common/info_card.dart';
import 'package:ecogo_mobile_app/widgets/common/player_info_card.dart';
import 'package:ecogo_mobile_app/widgets/common/stepper_card.dart';
import 'package:ecogo_mobile_app/widgets/common/prompt_card.dart';
import 'package:ecogo_mobile_app/widgets/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
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

          // Location Search Widget
          Align(
            alignment: Alignment.topCenter,
            child: PromptCard(
              heightFactor: 0.2,
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "/tree-house");
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: InfoCard(
                                  badge:
                                      SvgPicture.asset("assets/icons/tree.svg"),
                                  badgeColor: Color(0xFFB7F281),
                                  content: Row(
                                    children: [
                                      const Text(
                                        "Lv. 1",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0xFF464646),
                                        ),
                                      ),
                                      Text(
                                        " | 10 m",
                                        style: TextStyle(
                                          color: Color(0xFF000000)
                                              .withOpacity(0.4),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: InfoCard(
                                content: Row(
                                  children: const [
                                    Image(
                                      image:
                                          AssetImage("assets/icons/coin.png"),
                                    ),
                                    Text(
                                      "150",
                                      style: TextStyle(
                                        color: Color(0xFF464646),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/profile');
                            },
                            child: Container(
                              // margin: EdgeInsets.only(right: 10),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  // color: badgeColor,
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF5796DB),
                                      Color(0xFF4C79DF),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  )),
                              child: const CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.transparent,
                                child: Image(
                                  image: AssetImage("assets/icons/player.png"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/search');
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 6),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        // height: 30,
                        // margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                          color: const Color(0xFF000000).withOpacity(0.06),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 0, 1, 0),
                              child: Icon(
                                Icons.place_outlined,
                                color: const Color(0xFF000000).withOpacity(0.4),
                                size: 25,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Set Your Destination and Get x2 Bonus',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      const Color(0xFF000000).withOpacity(0.4),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Stepper Card
          const SafeArea(
            // TODO: Fix for android margin
            child: Align(
              alignment: Alignment.bottomCenter,
              child: StepperCard(),
            ),
          ),

          // Todo: Add AR and Current Location buttons on the map
        ],
      ),
    );
  }
}
