import 'package:ecogo_mobile_app/widgets/common/general_badge.dart';
import 'package:ecogo_mobile_app/widgets/common/general_card.dart';
import 'package:ecogo_mobile_app/widgets/common/top_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          fit: StackFit.loose,
          children: [
            const GeneralCard(
              topRight: Radius.zero,
              topLeft: Radius.zero,
              child: Text('Salam'),
            ),
            Positioned(
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
      ),
    );
  }
}
