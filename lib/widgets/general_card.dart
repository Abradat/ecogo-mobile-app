import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralCard extends StatefulWidget {
  final Widget child;
  final Radius topRight;
  final Radius topLeft;

  const GeneralCard({
    Key? key,
    required this.child,
    this.topRight = const Radius.circular(45),
    this.topLeft = const Radius.circular(45),
  }) : super(key: key);

  @override
  _GeneralCardState createState() => _GeneralCardState();
}

class _GeneralCardState extends State<GeneralCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFECF0FF),
        borderRadius: BorderRadius.only(
          topRight: widget.topRight,
          topLeft: widget.topLeft,
        ),
      ),
      padding: EdgeInsets.all(20),
      child: widget.child,
    );
  }
}
