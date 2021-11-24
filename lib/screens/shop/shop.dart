import 'package:ecogo_mobile_app/data/shop/category.dart';
import 'package:ecogo_mobile_app/widgets/common/control_button.dart';
import 'package:ecogo_mobile_app/widgets/common/info_card.dart';
import 'package:ecogo_mobile_app/widgets/shop/shop_list.dart';
import 'package:ecogo_mobile_app/widgets/shop/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int _selectedIndex = 0;
  List<Widget> _shopLists = <Widget>[
    ShopList(
      category: Category.top,
    ),
    ShopList(
      category: Category.bottom,
    ),
    ShopList(
      category: Category.face,
    ),
    ShopList(
      category: Category.redeem,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xFFDBEDFF),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: ControlButton(
                          icon: Icons.arrow_back,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Wallet(coin: 150),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
                  child: const Image(
                    image: AssetImage("assets/images/avatar_complete.png"),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            child: _shopLists.elementAt(_selectedIndex),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                          ),
                        ),
                        GNav(
                          rippleColor: Colors.grey[300]!,
                          hoverColor: Colors.grey[100]!,
                          gap: 8,
                          activeColor: Colors.black,
                          iconSize: 24,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          duration: Duration(milliseconds: 400),
                          tabBackgroundColor: Colors.grey[100]!,
                          color: Colors.black,
                          selectedIndex: _selectedIndex,
                          onTabChange: (index) {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          tabs: [
                            GButton(
                              icon: Icons.checkroom,
                              text: 'Top',
                            ),
                            GButton(
                              icon: Icons.checkroom,
                              text: 'Bottom',
                            ),
                            GButton(
                              icon: Icons.emoji_emotions_outlined,
                              text: 'Face',
                            ),
                            GButton(
                              icon: Icons.confirmation_number_outlined,
                              text: 'Redeem',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
