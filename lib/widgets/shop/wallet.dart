import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  final int coin;
  const Wallet({Key? key, required this.coin}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Image(
            image: AssetImage("assets/icons/coin.png"),
          ),
          Text(
            widget.coin.toString(),
            style: const TextStyle(
              color: Color(0xFF464646),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
