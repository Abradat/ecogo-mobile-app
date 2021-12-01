import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Destination {
  String _id = "";
  final String _name;
  final String _address;
  final LatLng _location;

  Destination(this._name, this._address, this._location, this._id);

  String get id => _id;

  LatLng get location => _location;

  String get address => _address;

  String get name => _name;

  set id(String value) {
    _id = value;
  }

  factory Destination.fromMap(Map<String, dynamic> map) {
    return Destination(map['name'], map['address'],
        LatLng(map['lat'], map['long']), map['id']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'name': _name,
      'address': _address,
      'lat': _location.latitude,
      'long': _location.longitude,
    };
  }
}
