import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplianceBottomSheet extends StatelessWidget {
  final Widget content;
  final double heightRatio;

  const ApplianceBottomSheet(
      {Key? key, required this.content, this.heightRatio = 0.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height * heightRatio,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 28,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: content,
            ),
          ),
        ],
      ),
    );
  }
}
