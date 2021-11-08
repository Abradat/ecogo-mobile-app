import 'package:ecogo_mobile_app/widgets/common/general_badge.dart';
import 'package:ecogo_mobile_app/widgets/common/general_card.dart';
import 'package:ecogo_mobile_app/widgets/common/top_bar.dart';
import 'package:ecogo_mobile_app/widgets/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Map(),
          ),
          SafeArea(
            child: TopBar(
              child: Row(
                children: [
                  const GeneralBadge(
                    child: Text(
                      "⭐️ 9999 pts",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: GeneralBadge(
                      child: Text(
                        "🪙 2222",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/shop');
                    },
                    child: const GeneralBadge(
                      child: Text(
                        "🛍 Shop",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
