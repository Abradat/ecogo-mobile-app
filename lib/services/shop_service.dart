import 'package:ecogo_mobile_app/data/shop_item.dart';

class ShopService {
  Future<List<ShopItem>> getShopItems() {
    return Future.delayed(
        const Duration(seconds: 1),
        () => [
              ShopItem("Shirt 1.png", "Sachit's shirt", 1000),
              ShopItem("Shirt 2.png", "Shayan's shirt", 4000),
            ]);
  }
}
