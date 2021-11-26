import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ApplianceItem extends StatefulWidget {
  final int index;
  final int id;
  final String imageUrl;
  final int price;
  final VoidCallback selected;
  final bool purchased;
  const ApplianceItem(
      {Key? key,
      required this.index,
      required this.id,
      required this.selected,
      required this.imageUrl,
      required this.price,
      required this.purchased})
      : super(key: key);

  @override
  _ApplianceItemState createState() => _ApplianceItemState();
}

class _ApplianceItemState extends State<ApplianceItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFFE7E7E7),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
                "assets/images/tree_house/furniture/" + widget.imageUrl),
            height: MediaQuery.of(context).size.width / 6,
            width: MediaQuery.of(context).size.width / 6,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/icons/coin.png"),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  widget.price.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
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
