import 'package:ecogo_mobile_app/widgets/common/bottom_sheet_card.dart';
import 'package:ecogo_mobile_app/widgets/common/control_button.dart';
import 'package:ecogo_mobile_app/widgets/profile/friends/friend_request_list.dart';
import 'package:ecogo_mobile_app/widgets/profile/friends/friends_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendsBottomSheet extends StatelessWidget {
  const FriendsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: BottomSheetCard(
        title: "Friends",
        action: ControlButton(
          icon: Icons.person_add_outlined,
          iconColor: Colors.white,
          backgroundColor: Color(0xFF466BE4),
          iconSize: 20,
          buttonSize: 32,
        ),
        child: Expanded(
          // height: 500,
          child: ListView(
            // shrinkWrap: true,
            children: [
              FriendRequestList(),
              FriendsList(),
            ],
          ),
        ),
      ),
    );
  }
}
