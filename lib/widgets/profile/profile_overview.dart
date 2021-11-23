import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileOverview extends StatelessWidget {
  final String userCode;
  final String username;
  final int level;
  final String image;

  const ProfileOverview(
      {Key? key,
      required this.userCode,
      required this.username,
      required this.level,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xFFCA4CDF),
                  Color(0xFF5796DB),
                ],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
              ),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: Image(
                image: AssetImage(image),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              color: Color(0xFFB7F281),
            ),
            child: Row(
              children: [
                Container(
                  child: SvgPicture.asset(
                    "assets/icons/tree.svg",
                    height: 20,
                  ),
                  margin: EdgeInsets.only(right: 5),
                ),
                Text(
                  "Lv.$level",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF464646),
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
