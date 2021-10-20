import 'package:ecogo_mobile_app/services/shop_service.dart';
import 'package:ecogo_mobile_app/widgets/general_card.dart';
import 'package:ecogo_mobile_app/widgets/shop/shop_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecogo_mobile_app/widgets/general_badge.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> with TickerProviderStateMixin {
  late TabController _tabController;
  late ShopService shopService;

  @override
  void initState() {
    super.initState();
    shopService = ShopService();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                GeneralBadge(
                  child: Text(
                    "⭐️ 9999 pts",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                GeneralBadge(
                  child: Icon(
                    Icons.clear,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              child: TabBar(
                  // padding: const EdgeInsets.symmetric(horizontal: 10),
                  controller: _tabController,
                  unselectedLabelColor: Color(0xFFA9C9E9),
                  isScrollable: true,
                  labelColor: Color(0xFF5073E6),
                  indicator: const BoxDecoration(
                    color: Color(0xFFECF0FF),
                  ),
                  tabs: const <Widget>[
                    Tab(
                      text: "Face",
                    ),
                    Tab(
                      text: "Top",
                    ),
                    Tab(text: "Pants"),
                    Tab(
                      text: "Shoes",
                    ),
                    Tab(
                      text: "Frames",
                    ),
                    Tab(text: "Redeem"),
                  ]),
            ),
            Expanded(
              child: GeneralCard(
                topLeft: Radius.zero,
                topRight: Radius.zero,
                child: TabBarView(
                    controller: _tabController,
                    children: const <Widget>[
                      ShopList(),
                      Center(child: Text("Shayan")),
                      Center(child: Text("Zhuaan")),
                      Center(child: Text("Zhuaan")),
                      Center(child: Text("Zhuaan")),
                      Center(child: Text("Zhuaan")),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
