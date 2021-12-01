import 'dart:async';
import 'dart:core';

import 'package:ecogo_mobile_app/data/constant/google_maps_constants.dart';
import 'package:ecogo_mobile_app/data/navigation/destination.dart';
import 'package:ecogo_mobile_app/services/location_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapNavigation extends StatefulWidget {
  final Destination destination;
  const MapNavigation({Key? key, required this.destination}) : super(key: key);

  @override
  MapNavigationState createState() => MapNavigationState();
}

class MapNavigationState extends State<MapNavigation> {
  final Completer<GoogleMapController> _controller = Completer();
  final LocationService _locationService = LocationService();
  // final Location _location = Location();
  late String _mapStyle;
  late Position _userLocation;

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 1,
  );
  late StreamSubscription<Position> positionStream;

  bool checked = true;
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);

  Set<Marker> markers = {};

  late PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(_mapStyle);
    // _calculateDistance();
    // getCurrentLocation();
    _controller.complete(controller);
  }

  Future<GoogleMapController> _getController() async {
    return await _controller.future;
  }

  Future<bool> _calculateDistance() async {
    getCurrentLocation();
    double startLatitude = _userLocation.latitude;
    double startLongitude = _userLocation.longitude;
    double destinationLatitude = widget.destination.location.latitude;
    double destinationLongitude = widget.destination.location.longitude;
    Marker destinationMarker = Marker(
      markerId: MarkerId(widget.destination.name),
      position: LatLng(widget.destination.location.latitude,
          widget.destination.location.longitude),
      infoWindow: InfoWindow(
        title: 'Destination ' + widget.destination.name,
        snippet: widget.destination.address,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    if (mounted) {
      setState(() {
        markers.add(destinationMarker);
      });
    }

    double miny = (startLatitude <= destinationLatitude)
        ? startLatitude
        : destinationLatitude;
    double minx = (startLongitude <= destinationLongitude)
        ? startLongitude
        : destinationLongitude;
    double maxy = (startLatitude <= destinationLatitude)
        ? destinationLatitude
        : startLatitude;
    double maxx = (startLongitude <= destinationLongitude)
        ? destinationLongitude
        : startLongitude;

    double southWestLatitude = miny;
    double southWestLongitude = minx;

    double northEastLatitude = maxy;
    double northEastLongitude = maxx;

    // Accommodate the two locations within the
    // camera view of the map
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          northeast: LatLng(northEastLatitude, northEastLongitude),
          southwest: LatLng(southWestLatitude, southWestLongitude),
        ),
        100.0,
      ),
    );

    if (checked) {
      _createPolylines(startLatitude, startLongitude, destinationLatitude,
          destinationLongitude);
    }
    return true;
  }

  void getCurrentLocation() async {
    _userLocation = await _locationService.determinePosition();
    GoogleMapController controller = await _controller.future;
    if (checked) {
      _calculateDistance();
    }
  }

  _createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      apiKey, // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.walking,
    );

    if (checked) {
      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      }
      checked = false;
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.white,
      points: polylineCoordinates,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      width: 2,
    );
    if (mounted) {
      setState(() {
        polylines[id] = polyline;
      });
    }
  }

  void startTracking() async {
    GoogleMapController controller = await _controller.future;
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      _userLocation = position;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(_userLocation.latitude, _userLocation.longitude),
            zoom: 18),
      ));
    });
  }

  void stopTracking() {
    positionStream.cancel();
  }

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
    getCurrentLocation();
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
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: Set<Marker>.from(markers),
      polylines: Set<Polyline>.of(polylines.values),
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: _initialcameraposition),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 12),
    );
  }
}
