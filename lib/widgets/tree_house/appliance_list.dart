import 'package:ecogo_mobile_app/data/tree_house/appliance_category.dart';
import 'package:ecogo_mobile_app/data/tree_house/appliance_item_data.dart';
import 'package:ecogo_mobile_app/services/appliance_service.dart';
import 'package:ecogo_mobile_app/widgets/common/control_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appliance_item.dart';

class ApplianceList extends StatefulWidget {
  final ApplianceCategory category;
  const ApplianceList({Key? key, required this.category}) : super(key: key);

  @override
  _ApplianceListState createState() => _ApplianceListState();
}

class _ApplianceListState extends State<ApplianceList> {
  final ApplianceService _applianceService = ApplianceService();
  List<ApplianceItemData>? applianceItems;
  int _selectedItemIndex = 0;

  Future<void> getItemData() async {
    final response = await _applianceService.getApplianceItems(widget.category);
    if (mounted) {
      setState(() {
        applianceItems = response;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getItemData();
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.category.toString().split(".").last.toUpperCase(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const ControlButton(
                icon: Icons.save_outlined,
                iconColor: Colors.white,
                backgroundColor: Color(0xFF466BE4),
                iconSize: 20,
                buttonSize: 32,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            // height: MediaQuery.of(context).size.height * 0.36,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2),
              children: applianceItems != null
                  ? applianceItems!
                      .map(
                        (item) => ApplianceItem(
                          index: item.id - 1,
                          id: item.id,
                          imageUrl: item.imageUrl,
                          price: item.price,
                          purchased: item.purchased,
                          isSelected:
                              _selectedItemIndex == item.id - 1 ? true : false,
                          selected: (int index) {
                            setState(() {
                              _selectedItemIndex = index;
                            });
                          },
                        ),
                      )
                      .toList()
                  : [],
            ),
          ),
        ),
      ],
    );
  }
}
