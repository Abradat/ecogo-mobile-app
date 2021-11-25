import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final Widget? badge;
  final Color? badgeColor;
  final Widget content;
  final double widthFactor;
  const InfoCard(
      {Key? key,
      this.badge,
      this.badgeColor,
      required this.content,
      this.widthFactor = 0.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(right: 10),
      padding: badge == null
          ? EdgeInsets.symmetric(horizontal: 10, vertical: 10)
          : null,
      decoration: BoxDecoration(
        color: Color(0xFF000000).withOpacity(0.06),
        borderRadius: BorderRadius.all(
          Radius.circular(MediaQuery.of(context).size.height),
        ),
      ),
      child: badge != null
          ? Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: badgeColor,
                  ),
                  child: CircleAvatar(
                    // radius: 20,
                    backgroundColor: Colors.transparent,
                    child: badge,
                  ),
                ),
                Expanded(child: content),
              ],
            )
          : Container(child: content),
    );
  }
}
