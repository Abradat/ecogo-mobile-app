import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ApplianceItem extends StatefulWidget {
  final int index;
  final int id;
  final String imageUrl;
  final int price;
  final Function(int) selected;
  final bool purchased;
  final bool isSelected;
  const ApplianceItem(
      {Key? key,
      required this.index,
      required this.id,
      required this.selected,
      required this.imageUrl,
      required this.price,
      required this.purchased,
      this.isSelected = false})
      : super(key: key);

  @override
  _ApplianceItemState createState() => _ApplianceItemState();
}

class _ApplianceItemState extends State<ApplianceItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selected(widget.index);
        });
      },
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: widget.isSelected
              ? Border.all(color: Color(0xFFFFBC08), width: 3)
              : null,
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
                  if (!widget.purchased)
                    Image(
                      image: AssetImage("assets/icons/coin.png"),
                    ),
                  if (!widget.purchased)
                    const SizedBox(
                      width: 3,
                    ),
                  !widget.purchased
                      ? Text(
                          widget.price.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : Text(
                          "Owned",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFBEBEBE),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
