import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromptCard extends StatefulWidget {
  final Widget child;
  final Radius top;
  final Radius bottom;
  final double heightFactor;

  const PromptCard(
      {required this.child,
      this.top = const Radius.circular(0),
      this.bottom = const Radius.circular(30),
      required this.heightFactor});

  @override
  State<PromptCard> createState() => _PromptCardState();
}

class _PromptCardState extends State<PromptCard> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.0,
      heightFactor: widget.heightFactor,
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(1.0),
          borderRadius:
              BorderRadius.vertical(top: widget.top, bottom: widget.bottom),
        ),
        // padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
        child: widget.child,
      ),
    );
  }
}
