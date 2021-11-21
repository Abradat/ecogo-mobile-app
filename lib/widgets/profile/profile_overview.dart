import 'package:flutter/cupertino.dart';

class ProfileOverview extends StatelessWidget {
  final String userCode;
  final String username;
  final int level;

  const ProfileOverview(
      {Key? key,
      required this.userCode,
      required this.username,
      required this.level})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ,
          ),
          Container(),
        ],
      ),
    );
  }
}
