import 'package:ecogo_mobile_app/widgets/common/general_badge.dart';
import 'package:ecogo_mobile_app/widgets/common/general_icon_badge.dart';
import 'package:ecogo_mobile_app/widgets/search/recent_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                child: const Text(
                  "Close",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Center(
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Container(
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    //TODO: Fix this Shadow
                    boxShadow: [
                      BoxShadow(blurRadius: 1.0, offset: Offset(0, 1))
                    ],
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 1, 0),
                        child: Icon(
                          Icons.place_outlined,
                          color: Color(0xFF5899DB),
                          size: 25,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Set Your Destination and Get x2 Bonus',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF548FDD).withOpacity(0.5),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: const Text(
                      "Suggested",
                      style: TextStyle(
                          color: Color(0xFFB6B6B6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        GeneralIconBadge(
                          text: "Home",
                          icon: Icon(Icons.home_outlined),
                        ),
                        GeneralIconBadge(
                          text: "Work",
                          icon: Icon(Icons.work_outlined),
                        ),
                        GeneralIconBadge(
                          text: "City Centre",
                          icon: Icon(Icons.apartment_outlined),
                        ),
                        GeneralIconBadge(
                          text: "Sachit's Home",
                          icon: Icon(Icons.mood_bad_outlined),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: const Text(
                        "Recent",
                        style: TextStyle(
                            color: Color(0xFFB6B6B6),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const RecentListTile(
                        title: "Tim Hortons",
                        address: "Great Northern Way",
                        score: 2600),
                    const RecentListTile(
                        title: "Tim Hortons",
                        address: "Great Northern Way",
                        score: 2600),
                    const RecentListTile(
                        title: "Tim Hortons",
                        address: "Great Northern Way",
                        score: 2600),
                    const RecentListTile(
                        title: "Tim Hortons",
                        address: "Great Northern Way",
                        score: 2600),
                    const RecentListTile(
                        title: "Tim Hortons",
                        address: "Great Northern Way",
                        score: 2600),
                    const RecentListTile(
                        title: "Tim Hortons",
                        address: "Great Northern Way",
                        score: 2600),
                    const RecentListTile(
                        title: "Tim Hortons",
                        address: "Great Northern Way",
                        score: 2600),
                    const RecentListTile(
                        title: "Tim Hortons",
                        address: "Great Northern Way",
                        score: 2600),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
