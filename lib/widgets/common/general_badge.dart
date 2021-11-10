import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralBadge extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const GeneralBadge({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    this.margin = const EdgeInsets.symmetric(horizontal: 5),
  }) : super(key: key);

  @override
  _GeneralBadgeState createState() => _GeneralBadgeState();
}

class _GeneralBadgeState extends State<GeneralBadge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(0xFF538CDE),
        gradient: LinearGradient(colors: [
          Color(0xFF4C79DF),
          Color(0XFF5796DB),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      padding: widget.padding,
      margin: widget.margin,
      child: widget.child,
    );
  }
}
