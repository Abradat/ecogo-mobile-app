import 'dart:async';

import 'package:ecogo_mobile_app/data/user_location.dart';
import 'package:ecogo_mobile_app/services/location_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final Completer<GoogleMapController> _controller = Completer();
  final LocationService _locationService = LocationService();
  final Location _location = Location();
  LocationData? _userLocation;
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);

  void _onMapCreated(GoogleMapController controller) {
    _getCurrentLocation();
    _controller.complete(controller);
    _location.onLocationChanged.listen((newLocation) async {
      GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(newLocation.latitude!, newLocation.longitude!),
            zoom: 15),
      ));
    });
  }

  void _getCurrentLocation() async {
    _userLocation = await _locationService.getLocation();
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
          target: LatLng(_userLocation!.latitude!, _userLocation!.longitude!),
          zoom: 15),
    ));
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationEnabled: true,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: _initialcameraposition),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 12),
    );
  }
}
