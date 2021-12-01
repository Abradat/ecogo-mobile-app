import 'package:ecogo_mobile_app/data/navigation/destination.dart';
import 'package:ecogo_mobile_app/services/location_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecogo_mobile_app/data/constant/design_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:location/location.dart';

class DestinationItem extends StatefulWidget {
  final int score;
  final int reward;
  final int time;
  final double distance;
  DestinationItem({
    Key? key,
    required this.score,
    required this.reward,
    required this.time,
    required this.distance,
  }) : super(key: key);

  @override
  State<DestinationItem> createState() => _DestinationItemState();
}

class _DestinationItemState extends State<DestinationItem> {
  final double borderRadius = ITEM_BORDER_RADIUS;

  @override
  void initState() {
    super.initState();
  }

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
                      widget.score.toString(),
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
                  double.parse(widget.distance.toStringAsFixed(2)).toString() +
                      " Km",
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
                  widget.time.toString() + "min",
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
                    widget.score.toString(),
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
