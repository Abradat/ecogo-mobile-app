import 'dart:async';

import 'package:ecogo_mobile_app/data/map_location.dart';
import 'package:ecogo_mobile_app/services/location_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart' show rootBundle;

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  MapState createState() => MapState();
}

class MapState extends State<Map> {
  final Completer<GoogleMapController> _controller = Completer();
  final LocationService _locationService = LocationService();
  final Location _location = Location();
  late String _mapStyle;
  // LocationData? _userLocation;
  late Position _userLocation;
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);

  void _onMapCreated(GoogleMapController controller) {
    getCurrentLocation();
    controller.setMapStyle(_mapStyle);

    // _location.onLocationChanged.listen((newLocation) async {
    //   GoogleMapController controller = await _controller.future;
    //   controller.animateCamera(CameraUpdate.newCameraPosition(
    //     CameraPosition(
    //         target: LatLng(newLocation.latitude!, newLocation.longitude!),
    //         zoom: 15),
    //   ));
    // });
    _controller.complete(controller);
  }

  Future<GoogleMapController> _getController() async {
    return await _controller.future;
  }

  void getCurrentLocation() async {
    // _userLocation = await _locationService.getLocation();
    _userLocation = await _locationService.determinePosition();
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
          target: LatLng(_userLocation.latitude, _userLocation.longitude),
          zoom: 15),
    ));
  }

  void disposeController() async {
    GoogleMapController controller = await _controller.future;
    controller.dispose();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   disposeController();
  // }

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: _initialcameraposition),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 12),
    );
  }
}
