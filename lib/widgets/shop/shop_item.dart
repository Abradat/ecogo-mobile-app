import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopItemCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int price;

  ShopItemCard(
      {required this.imageUrl, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDialog(context);
      },
      child: Container(
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
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  letterSpacing: 0.1,
                  wordSpacing: 0.1,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "⭐️ $price pts",
                style: const TextStyle(color: Color(0xFF466BE4)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        title: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage("assets/images/$imageUrl"),
              fit: BoxFit.fill,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF466BE4),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
              child: Text(
                "Purchase with ⭐️ $price pts",
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
