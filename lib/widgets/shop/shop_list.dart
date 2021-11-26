import 'package:ecogo_mobile_app/data/shop/category.dart';
import 'package:ecogo_mobile_app/data/shop/shop_item.dart';
import 'package:ecogo_mobile_app/widgets/shop/shop_item.dart';
import 'package:ecogo_mobile_app/services/shop_service.dart';
import 'package:flutter/cupertino.dart';

class ShopList extends StatefulWidget {
  final Category category;
  const ShopList({Key? key, required this.category}) : super(key: key);

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
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  widget.category.toString().split(".").last.toUpperCase(),
                  // textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Text("Save"),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 1,
            childAspectRatio: 0.8,
            children: shopItems != null
                ? shopItems!
                    .map((item) => ShopItemCard(
                          imageUrl: item.imageUrl,
                          name: item.itemName,
                          price: item.itemPrice,
                        ))
                    .toList()
                : [],
          ),
        ),
      ],
    );
  }
}
