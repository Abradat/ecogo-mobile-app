import 'package:flutter/cupertino.dart';
import 'package:ecogo_mobile_app/data/constant/design_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DestinationItem extends StatelessWidget {
  final double distance;
  final int time;
  final int score;
  final int reward;

  DestinationItem({
    Key? key,
    required this.distance,
    required this.time,
    required this.score,
    required this.reward,
  }) : super(key: key);

  final double borderRadius = ITEM_BORDER_RADIUS;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(borderRadius),
            bottom: Radius.circular(borderRadius)),
        border: Border.all(
          color: const Color(0xFF5899DB),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1D8A49),
                  Color(0XFF29CE6B),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: MediaQuery.of(context).size.height / 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/shoe.svg',
                      color: Colors.white,
                      height: 21,
                    ),
                    Text(
                      score.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    )
                  ],
                )),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Distance",
                  style: TextStyle(
                    color: Color(0xFF000000).withOpacity(0.6),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  distance.toString() + " Km",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF000000).withOpacity(0.6),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Time",
                  style: TextStyle(
                    color: Color(0xFF000000).withOpacity(0.6),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  time.toString() + "min",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF000000).withOpacity(0.6),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reward",
                style: TextStyle(
                  color: Color(0xFF000000).withOpacity(0.6),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Image(
                    image: AssetImage("assets/icons/coin.png"),
                  ),
                  Text(
                    score.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF000000).withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
