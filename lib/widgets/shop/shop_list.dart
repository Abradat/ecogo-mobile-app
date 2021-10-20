import 'package:ecogo_mobile_app/widgets/shop/shop_item.dart';
import 'package:flutter/cupertino.dart';

class ShopList extends StatefulWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 1,
      childAspectRatio: 0.7,
      children: [
        ShopItem(
            imageUrl: "sample-shirt.png",
            clothName: "new collection 2021",
            clothPrice: 100),
        ShopItem(
            imageUrl: "sample-shirt.png",
            clothName: "new collection 2020",
            clothPrice: 10),
        ShopItem(
            imageUrl: "sample-shirt.png",
            clothName: "new collection 2019",
            clothPrice: 200),
        ShopItem(
            imageUrl: "sample-shirt.png",
            clothName: "new collection 2018",
            clothPrice: 1000),
        ShopItem(
            imageUrl: "sample-shirt.png",
            clothName: "new collection 2018",
            clothPrice: 200),
        ShopItem(
            imageUrl: "sample-shirt.png",
            clothName: "new collection 2023",
            clothPrice: 10),
        ShopItem(
            imageUrl: "sample-shirt.png",
            clothName: "new collection 2022",
            clothPrice: 500),
        ShopItem(
            imageUrl: "sample-shirt.png",
            clothName: "new collection 2028",
            clothPrice: 1200),
      ],
    );
  }
}
