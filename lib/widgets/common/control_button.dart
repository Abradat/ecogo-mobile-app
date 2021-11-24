import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? buttonSize;
  final double? iconSize;
  const ControlButton(
      {Key? key,
      required this.icon,
      this.backgroundColor = Colors.white,
      this.iconColor = Colors.black,
      this.buttonSize = 40,
      this.iconSize = 28})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: buttonSize,
      width: buttonSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
