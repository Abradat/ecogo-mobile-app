import 'package:ecogo_mobile_app/data/shop_item.dart';
import 'package:ecogo_mobile_app/widgets/shop/shop_item.dart';
import 'package:ecogo_mobile_app/services/shop_service.dart';
import 'package:flutter/cupertino.dart';

class ShopList extends StatefulWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  final ShopService shopService = ShopService();
  List<ShopItem>? shopItems;

  Future<void> getItemData() async {
    final response = await shopService.getShopItems();
    setState(() {
      shopItems = response;
    });
  }

  @override
  void initState() {
    super.initState();
    getItemData();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 1,
      childAspectRatio: 0.7,
      children: shopItems != null
          ? shopItems!
              .map((item) => ShopItemCard(
                    imageUrl: item.imageUrl,
                    name: item.itemName,
                    price: item.itemPrice,
                  ))
              .toList()
          : []
      // ShopItemCard(
      //     imageUrl: "sample-shirt.png",
      //     clothName: "new collection 2021",
      //     clothPrice: 100),
      // ShopItemCard(
      //     imageUrl: "sample-shirt.png",
      //     clothName: "new collection 2020",
      //     clothPrice: 10),
      // ShopItemCard(
      //     imageUrl: "sample-shirt.png",
      //     clothName: "new collection 2019",
      //     clothPrice: 200),
      // ShopItemCard(
      //     imageUrl: "sample-shirt.png",
      //     clothName: "new collection 2018",
      //     clothPrice: 1000),
      // ShopItemCard(
      //     imageUrl: "sample-shirt.png",
      //     clothName: "new collection 2018",
      //     clothPrice: 200),
      // ShopItemCard(
      //     imageUrl: "sample-shirt.png",
      //     clothName: "new collection 2023",
      //     clothPrice: 10),
      // ShopItemCard(
      //     imageUrl: "sample-shirt.png",
      //     clothName: "new collection 2022",
      //     clothPrice: 500),
      // ShopItemCard(
      //     imageUrl: "sample-shirt.png",
      //     clothName: "new collection 2028",
      //     clothPrice: 1200),
      ,
    );
  }
}
