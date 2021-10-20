import 'package:flutter/cupertino.dart';

class ShopItem extends StatelessWidget {
  final String imageUrl;
  final String clothName;
  final int clothPrice;

  ShopItem(
      {required this.imageUrl,
      required this.clothName,
      required this.clothPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Image(
              image: AssetImage("assets/images/$imageUrl"),
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              clothName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 0.1,
                wordSpacing: 0.1,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "⭐️ $clothPrice pts",
              style: const TextStyle(color: Color(0xFF466BE4)),
            ),
          ),
        ],
      ),
    );
  }
}
