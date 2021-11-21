import 'package:ecogo_mobile_app/data/navigation/directions_orientation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DirectionsCard extends StatefulWidget {
  const DirectionsCard({Key? key}) : super(key: key);

  @override
  _DirectionsCardState createState() => _DirectionsCardState();
}

class _DirectionsCardState extends State<DirectionsCard> {
  String text = "Goo";
  DirectionsOrientation orientation = DirectionsOrientation.straight;
  int meters = 100;

  @override
  void initState() {
    super.initState();
  }

  IconData getOrientation() {
    if (orientation == DirectionsOrientation.turnLeft) {
      return Icons.arrow_back;
    } else if (orientation == DirectionsOrientation.turnRight) {
      return Icons.arrow_forward;
    } else {
      return Icons.arrow_upward;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          color: Color(0xFF29CE6B),
        ),
        child: Row(
          children: [
            Column(
              children: [
                Icon(
                  getOrientation(),
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  meters.toString() + "m",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
