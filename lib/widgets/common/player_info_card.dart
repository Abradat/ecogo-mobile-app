import 'package:ecogo_mobile_app/data/info_card_direction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerInfoCard extends StatelessWidget {
  final InfoCardDirection direction;
  final Widget firstRow;
  final Widget? secondRow;
  final Image image;
  final Widget? imageBadge;
  final double widthFactor;
  const PlayerInfoCard(
      {required this.direction,
      required this.firstRow,
      this.secondRow,
      required this.image,
      this.imageBadge,
      this.widthFactor = 0.49})
      : super();

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.08,
      widthFactor: widthFactor,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF).withOpacity(0.75),
          borderRadius: BorderRadius.all(
            Radius.circular(MediaQuery.of(context).size.height),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (direction == InfoCardDirection.left)
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color(0xFF4C79DF),
                    Color(0XFF5796DB),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.height / 26,
                  backgroundColor: Colors.transparent,
                  child: Text("Left"),
                ),
              ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  firstRow,
                  if (secondRow != null) secondRow!,
                ],
              ),
            ),
            if (direction == InfoCardDirection.right)
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Color(0xFF4C79DF),
                    Color(0XFF5796DB),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.height / 26,
                  backgroundColor: Colors.transparent,
                  child: Text("Left"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
