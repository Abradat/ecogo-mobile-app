import 'package:ecogo_mobile_app/widgets/common/general_icon_badge.dart';
import 'package:ecogo_mobile_app/widgets/search/recent_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
                  decoration: BoxDecoration(
                    color: Color(0xFF000000).withOpacity(0.06),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 1, 0),
                        child: Icon(
                          Icons.place_outlined,
                          color: Color(0xFF000000).withOpacity(0.4),
                          size: 25,
                        ),
                      ),
                      const Expanded(
                        child: TextField(
                          // TODO: Fix Appearance of Textfield
                          autofocus: true,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Expanded(
                      child: ListView(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          RecentListTile(
                            title: "Tim Hortons",
                            address: "Great Northern Way",
                            score: 2600,
                            location:
                                LatLng(49.26290268543555, -123.0876085427132),
                          ),
                          RecentListTile(
                            title: "Tim Hortons",
                            address: "Great Northern Way",
                            score: 2600,
                            location:
                                LatLng(49.26290268543555, -123.0876085427132),
                          ),
                          RecentListTile(
                            title: "Tim Hortons",
                            address: "Great Northern Way",
                            score: 2600,
                            location:
                                LatLng(49.26290268543555, -123.0876085427132),
                          ),
                          RecentListTile(
                            title: "Tim Hortons",
                            address: "Great Northern Way",
                            score: 2600,
                            location:
                                LatLng(49.26290268543555, -123.0876085427132),
                          ),
                          RecentListTile(
                            title: "Tim Hortons",
                            address: "Great Northern Way",
                            score: 2600,
                            location:
                                LatLng(49.26290268543555, -123.0876085427132),
                          ),
                          RecentListTile(
                            title: "Tim Hortons",
                            address: "Great Northern Way",
                            score: 2600,
                            location:
                                LatLng(49.26290268543555, -123.0876085427132),
                          ),
                          RecentListTile(
                            title: "Tim Hortons",
                            address: "Great Northern Way",
                            score: 2600,
                            location:
                                LatLng(49.26290268543555, -123.0876085427132),
                          ),
                          RecentListTile(
                            title: "Tim Hortons",
                            address: "Great Northern Way",
                            score: 2600,
                            location:
                                LatLng(49.26290268543555, -123.0876085427132),
                          ),
                        ],
                      ),
                    ),
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
