import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralIconBadge extends StatelessWidget {
  final String text;
  final Icon icon;
  const GeneralIconBadge({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.only(right: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xFF538CDE),
        gradient: LinearGradient(colors: [
          Color(0xFF4C79DF),
          Color(0XFF5796DB),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Icon(
              icon.icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
