import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io' show Platform;

import 'package:pedometer/pedometer.dart';

class StepperCard extends StatefulWidget {
  const StepperCard({Key? key}) : super(key: key);

  @override
  _StepperCardState createState() => _StepperCardState();
}

class _StepperCardState extends State<StepperCard> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = '-1';
    });
  }

  void initPlatformState() async {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin:
          Platform.isAndroid ? EdgeInsets.only(bottom: 30) : EdgeInsets.zero,
      height: MediaQuery.of(context).size.height / 12,
      width: MediaQuery.of(context).size.width - 20,
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
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "$_steps Steps",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0XFF1EA353),
                              fontWeight: FontWeight.w700),
                        ),
                        margin: EdgeInsets.only(right: 1),
                      ),
                      Text(
                        " Taken! Great Job!!",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
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
                      value: 0.8,
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
