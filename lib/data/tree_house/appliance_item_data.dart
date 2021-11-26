import 'package:ecogo_mobile_app/data/tree_house/appliance_category.dart';

class ApplianceItemData {
  final int _id;
  final String _imageUrl;
  final int _price;
  final ApplianceCategory _category;
  bool _purchased;

  ApplianceItemData(
      this._id, this._imageUrl, this._price, this._category, this._purchased);

  int get id => _id;

  ApplianceCategory get category => _category;

  int get price => _price;

  String get imageUrl => _imageUrl;

  bool get purchased => _purchased;

  set purchased(bool value) {
    _purchased = value;
  }
}
