import 'package:flutter/cupertino.dart';

class MapNavigation extends StatefulWidget {
  final int point;
  final double distance;
  final int time;
  final int reward;

  const MapNavigation(
      {Key? key,
      required this.point,
      required this.distance,
      required this.time,
      required this.reward})
      : super(key: key);

  @override
  _MapNavigationState createState() => _MapNavigationState();
}

class _MapNavigationState extends State<MapNavigation> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
      ),
    );
  }
}
