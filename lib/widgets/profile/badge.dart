import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final bool locked;
  final String image;
  final String title;
  final int required;
  final int progress;
  const Badge(
      {Key? key,
      required this.locked,
      required this.image,
      required this.title,
      required this.progress,
      required this.required})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image(
              image: !locked
                  ? AssetImage("assets/images/profile/badge/$image")
                  : AssetImage("assets/images/profile/badge/locked.png"),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Text(
            "Walking Steps",
            style: TextStyle(
              color: Color(0xFF717171),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "$progress/$required",
            style: const TextStyle(
              color: Color(0xFF717171),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
