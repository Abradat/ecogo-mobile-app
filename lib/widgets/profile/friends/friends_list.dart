import 'package:ecogo_mobile_app/data/profile/user.dart';
import 'package:ecogo_mobile_app/widgets/profile/friends/friend_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendsList extends StatefulWidget {
  const FriendsList({Key? key}) : super(key: key);

  @override
  _FriendsListState createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  final User user =
      User("Jason", "128730", "VanCity", 24, "sample_profile_pic.png");

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
              color: Colors.black.withOpacity(0.06),
            ),
            child: const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Search Friend'),
            ),
          ),
          FriendsListItem(
            user: user,
          ),
          FriendsListItem(
            user: user,
          ),
          FriendsListItem(
            user: user,
          ),
          FriendsListItem(
            user: user,
          ),
          FriendsListItem(
            user: user,
          ),
        ],
      ),
    );
  }
}
