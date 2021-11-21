import 'package:google_maps_flutter/google_maps_flutter.dart';

class Destination {
  final String name;
  final String address;
  final LatLng location;
  final int score;
  final int reward;

  Destination(this.name, this.address, this.location, this.score, this.reward);
}
