import 'package:ecogo_mobile_app/data/tree_house/appliance_category.dart';
import 'package:ecogo_mobile_app/widgets/tree_house/appliance_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ApplianceCatalogue extends StatefulWidget {
  const ApplianceCatalogue({Key? key}) : super(key: key);

  @override
  _ApplianceCatalougeState createState() => _ApplianceCatalougeState();
}

class _ApplianceCatalougeState extends State<ApplianceCatalogue> {
  int _selectedIndex = 0;
  static const List<Widget> _applianceLists = <Widget>[
    ApplianceList(
      category: ApplianceCategory.bed,
    ),
    ApplianceList(
      category: ApplianceCategory.chair,
    ),
    ApplianceList(
      category: ApplianceCategory.sofa,
    ),
    ApplianceList(
      category: ApplianceCategory.furniture,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Expanded(
            child: _applianceLists.elementAt(_selectedIndex),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: [
                GButton(
                  icon: Icons.bed_outlined,
                  text: 'Bed',
                ),
                GButton(
                  icon: Icons.chair_alt_outlined,
                  text: 'Chair',
                ),
                GButton(
                  icon: Icons.weekend_outlined,
                  text: 'Sofa',
                ),
                GButton(
                  icon: Icons.kitchen_outlined,
                  text: 'Furniture',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
