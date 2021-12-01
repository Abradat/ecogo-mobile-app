import 'package:ecogo_mobile_app/data/navigation/destination.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RecentListTile extends StatelessWidget {
  final Destination destination;
  final int score;
  const RecentListTile({
    Key? key,
    required this.destination,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var id = destination.id;
        var lat = destination.location.latitude;
        var long = destination.location.longitude;
        var name = destination.name;
        var address = destination.address;
        Navigator.pushNamed(
            context,
            '/navigation?id=$id&name=$name'
            '&addr=$address&lat=$lat&long=$long');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: const Color(0xFF212121).withOpacity(0.08),
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
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
                  radius: MediaQuery.of(context).size.height / 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/shoe.svg',
                        color: Colors.white,
                        height: 21,
                      ),
                      Text(
                        score.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        destination.name,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.87),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 25,
                      child: Text(
                        destination.address,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
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
