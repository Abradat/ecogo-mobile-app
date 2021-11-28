import 'package:ecogo_mobile_app/data/tree_house/appliance_category.dart';
import 'package:ecogo_mobile_app/data/tree_house/appliance_item_data.dart';

class ApplianceService {
  List<ApplianceItemData> doorItems = [
    ApplianceItemData(1, "door_red.png", 10, ApplianceCategory.door, true),
    ApplianceItemData(2, "door_brown.png", 20, ApplianceCategory.door, false),
    ApplianceItemData(3, "door_green.png", 30, ApplianceCategory.door, false),
    ApplianceItemData(4, "door_red.png", 100, ApplianceCategory.door, false),
    ApplianceItemData(5, "door_brown.png", 200, ApplianceCategory.door, false),
    ApplianceItemData(6, "door_green.png", 300, ApplianceCategory.door, false),
    ApplianceItemData(7, "door_red.png", 1000, ApplianceCategory.door, false),
    ApplianceItemData(8, "door_brown.png", 2000, ApplianceCategory.door, false),
    ApplianceItemData(9, "door_green.png", 3000, ApplianceCategory.door, false),
  ];

  List<ApplianceItemData> furnitureItems = [
    ApplianceItemData(
        1, "furniture_sona.png", 1000, ApplianceCategory.furniture, true),
    ApplianceItemData(
        2, "furniture_bedroom_1.png", 1000, ApplianceCategory.furniture, false),
    ApplianceItemData(
        3, "furniture_bedroom_2.png", 1000, ApplianceCategory.furniture, false),
    ApplianceItemData(
        4, "furniture_bedroom_3.png", 1000, ApplianceCategory.furniture, false),
    ApplianceItemData(
        5, "furniture_bedroom_2.png", 1000, ApplianceCategory.furniture, false),
    ApplianceItemData(
        6, "furniture_bedroom_1.png", 1000, ApplianceCategory.furniture, false),
  ];

  List<ApplianceItemData> chairItems = [
    ApplianceItemData(1, "chair_1.png", 10, ApplianceCategory.chair, false),
    ApplianceItemData(2, "chair_2.png", 100, ApplianceCategory.chair, false),
    ApplianceItemData(3, "chair_3.png", 500, ApplianceCategory.chair, false),
    ApplianceItemData(4, "chair_4.png", 1000, ApplianceCategory.chair, false),
    ApplianceItemData(5, "chair_5.png", 5000, ApplianceCategory.chair, false),
    ApplianceItemData(6, "chair_6.png", 10000, ApplianceCategory.chair, false),
  ];

  List<ApplianceItemData> bedItems = [
    ApplianceItemData(1, "bed_1.png", 10, ApplianceCategory.bed, false),
    ApplianceItemData(2, "bed_2.png", 100, ApplianceCategory.bed, false),
    ApplianceItemData(3, "bed_3.png", 500, ApplianceCategory.bed, false),
    ApplianceItemData(4, "bed_4.png", 1000, ApplianceCategory.bed, false),
    ApplianceItemData(5, "bed_5.png", 5000, ApplianceCategory.bed, false),
    ApplianceItemData(6, "bed_6.png", 10000, ApplianceCategory.bed, false),
  ];

  List<ApplianceItemData> sofaItems = [
    ApplianceItemData(1, "sofa_1.png", 10, ApplianceCategory.sofa, false),
    ApplianceItemData(2, "sofa_2.png", 100, ApplianceCategory.sofa, false),
    ApplianceItemData(3, "sofa_3.png", 500, ApplianceCategory.sofa, false),
    ApplianceItemData(4, "sofa_4.png", 1000, ApplianceCategory.sofa, false),
    ApplianceItemData(5, "sofa_5.png", 5000, ApplianceCategory.sofa, false),
    ApplianceItemData(6, "sofa_6.png", 10000, ApplianceCategory.sofa, false),
  ];

  Future<List<ApplianceItemData>> getApplianceItems(
      ApplianceCategory category) {
    return Future.delayed(const Duration(milliseconds: 500), () {
      if (category == ApplianceCategory.door) {
        return doorItems;
      } else if (category == ApplianceCategory.furniture) {
        return furnitureItems;
      } else if (category == ApplianceCategory.bed) {
        return bedItems;
      } else if (category == ApplianceCategory.sofa) {
        return sofaItems;
      } else {
        return chairItems;
      }
    });
  }

  // TODO: Implement Purchase
}
