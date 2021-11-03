import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final Widget child;
  final Radius top;
  final Radius bottom;

  const TopBar(
      {required this.child,
      this.top = const Radius.circular(0),
      this.bottom = const Radius.circular(30)});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.vertical(top: top, bottom: bottom),
      ),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
      child: child,
    );
  }
}
