import 'package:ecogo_mobile_app/data/tree_house/appliance_category.dart';
import 'package:ecogo_mobile_app/widgets/common/bottom_sheet_card.dart';
import 'package:ecogo_mobile_app/widgets/common/control_button.dart';
import 'package:ecogo_mobile_app/widgets/tree_house/appliance_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoorBottomSheet extends StatefulWidget {
  const DoorBottomSheet({Key? key}) : super(key: key);

  @override
  _DoorBottomSheetState createState() => _DoorBottomSheetState();
}

class _DoorBottomSheetState extends State<DoorBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: BottomSheetCard(
        title: "Door",
        child: ApplianceList(
          category: ApplianceCategory.door,
        ),
        action: ControlButton(
          icon: Icons.save_outlined,
          iconColor: Colors.white,
          backgroundColor: Color(0xFF466BE4),
          iconSize: 20,
          buttonSize: 32,
        ),
        heightRatio: 0.5,
      ),
    );
  }
}
