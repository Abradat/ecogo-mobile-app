import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  final IconData icon;
  const ControlButton({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Icon(
        icon,
        color: Colors.black,
        size: 28,
      ),
    );
  }
}
