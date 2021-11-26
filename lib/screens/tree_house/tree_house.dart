import 'package:ecogo_mobile_app/data/tree_house/appliance_category.dart';
import 'package:ecogo_mobile_app/screens/profile/friends.dart';
import 'package:ecogo_mobile_app/widgets/tree_house/appliance_bottom_sheet.dart';
import 'package:ecogo_mobile_app/widgets/tree_house/appliance_catalogue.dart';
import 'package:ecogo_mobile_app/widgets/tree_house/appliance_list.dart';
import 'package:ecogo_mobile_app/widgets/tree_house/door_bottom_sheet.dart';
import 'package:ecogo_mobile_app/widgets/common/control_button.dart';
import 'package:ecogo_mobile_app/widgets/common/info_card.dart';
import 'package:ecogo_mobile_app/widgets/common/prompt_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TreeHouseScreen extends StatefulWidget {
  const TreeHouseScreen({Key? key}) : super(key: key);

  @override
  State<TreeHouseScreen> createState() => _TreeHouseScreenState();
}

class _TreeHouseScreenState extends State<TreeHouseScreen> {
  bool _inEdit = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFDBEDFF),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: PromptCard(
              heightFactor: 0.13,
              child: SafeArea(
                bottom: false,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: InfoCard(
                          badge: SvgPicture.asset("assets/icons/tree.svg"),
                          badgeColor: Color(0xFFB7F281),
                          content: Row(
                            children: [
                              const Text(
                                "Lv. 1",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xFF464646),
                                ),
                              ),
                              Text(
                                " | 10 m",
                                style: TextStyle(
                                  color: Color(0xFF000000).withOpacity(0.4),
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: InfoCard(
                          content: Row(
                            children: const [
                              Image(
                                image: AssetImage("assets/icons/coin.png"),
                              ),
                              Text(
                                "150",
                                style: TextStyle(
                                  color: Color(0xFF464646),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(right: 10),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // color: badgeColor,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF5796DB),
                              Color(0xFF4C79DF),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          )),
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        child: Image(
                          image: AssetImage("assets/icons/player.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Tree House
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              bottom: false,
              child: Container(
                width: double.infinity,
                // height: double.infinity,
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/tree_house/tree_house.png"),
                ),
              ),
            ),
          ),

          // Control Buttons
          Align(
            alignment: FractionalOffset(0, 0.13),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    // TODO: Add Box shadow for control buttons
                    child: const ControlButton(
                      buttonSize: 50,
                      iconSize: 30,
                      icon: Icons.map_outlined,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _inEdit = !_inEdit;
                      });
                      ;
                    },
                    // TODO: Add Box shadow for control buttons
                    child: ControlButton(
                      buttonSize: 50,
                      iconSize: 30,
                      iconColor: !_inEdit ? Colors.black : Color(0xFF29CE6B),
                      icon:
                          !_inEdit ? Icons.chair_outlined : Icons.done_outlined,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Edit windows
          if (_inEdit)
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: FractionalOffset(
                      0.55,
                      0.68,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return ApplianceBottomSheet(
                                content: ApplianceList(
                                  category: ApplianceCategory.door,
                                ),
                              );
                            });
                      },
                      child: Image(
                        image: AssetImage(
                            "assets/images/tree_house/furniture_window.png"),
                      ),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset(
                      0.56,
                      0.53,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return ApplianceBottomSheet(
                                content: ApplianceCatalogue(),
                              );
                            });
                      },
                      child: Image(
                        image: AssetImage(
                            "assets/images/tree_house/add_furniture_window.png"),
                      ),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset(
                      0.2,
                      0.53,
                    ),
                    child: Image(
                      image: AssetImage(
                          "assets/images/tree_house/add_furniture_window.png"),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset(
                      0.87,
                      0.51,
                    ),
                    child: Image(
                      image: AssetImage(
                          "assets/images/tree_house/add_furniture_window.png"),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset(
                      0.77,
                      0.4,
                    ),
                    child: Image(
                      image: AssetImage(
                          "assets/images/tree_house/add_furniture_window.png"),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
