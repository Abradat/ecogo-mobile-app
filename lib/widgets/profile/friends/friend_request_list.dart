import 'package:ecogo_mobile_app/data/profile/user.dart';
import 'package:ecogo_mobile_app/widgets/profile/friends/friend_request_item.dart';
import 'package:flutter/cupertino.dart';

class FriendRequestList extends StatefulWidget {
  const FriendRequestList({Key? key}) : super(key: key);

  @override
  _FriendRequestListState createState() => _FriendRequestListState();
}

class _FriendRequestListState extends State<FriendRequestList> {
  final User user =
      User("Jason", "128730", "VanCity", 24, "sample_profile_pic.png");
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Friend Request",
            style: TextStyle(
              color: Color(0xFFB6B6B6),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          FriendRequestItem(
            user: user,
          ),
          FriendRequestItem(
            user: user,
          ),
        ],
      ),
    );
  }
}
