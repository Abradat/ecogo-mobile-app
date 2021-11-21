import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StepperCard extends StatefulWidget {
  const StepperCard({Key? key}) : super(key: key);

  @override
  _StepperCardState createState() => _StepperCardState();
}

class _StepperCardState extends State<StepperCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: MediaQuery.of(context).size.height / 12,
      width: MediaQuery.of(context).size.width - 50,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF).withOpacity(0.8),
        borderRadius: BorderRadius.all(
          Radius.circular(MediaQuery.of(context).size.height),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/shop');
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF1D8A49),
                      Color(0XFF29CE6B),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: MediaQuery.of(context).size.height / 25,
                  child: SvgPicture.asset(
                    'assets/icons/shoe.svg',
                    color: Colors.white,
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "24/500",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0XFF1EA353),
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Steps for your Tree to level up!",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: 0.05,
                      color: Color(0xFF29CE6B),
                      minHeight: 10,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
