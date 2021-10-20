import 'package:ecogo_mobile_app/data/shop_item.dart';

class ShopService {
  Future<List<ShopItem>> getShopItems() async {
    return [
      ShopItem("sample-shirt.png", "Sachit's shirt", 1000),
      ShopItem("sample-shirt.png", "Shayan's shirt", 4000)
    ];
  }
}
