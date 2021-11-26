import 'package:ecogo_mobile_app/data/tree_house/appliance_category.dart';
import 'package:ecogo_mobile_app/data/tree_house/appliance_item_data.dart';
import 'package:ecogo_mobile_app/services/appliance_service.dart';
import 'package:flutter/cupertino.dart';

class DoorList extends StatefulWidget {
  const DoorList({Key? key}) : super(key: key);

  @override
  _DoorListState createState() => _DoorListState();
}

class _DoorListState extends State<DoorList> {
  final ApplianceService _applianceService = ApplianceService();
  List<ApplianceItemData>? doorItems;

  Future<void> getItemData() async {
    final response =
        await _applianceService.getApplianceItems(ApplianceCategory.door);
    setState(() {
      doorItems = response;
    });
  }

  @override
  void initState() {
    super.initState();
    getItemData();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
