import 'dart:async';
import 'dart:core';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:ecogo_mobile_app/data/constant/google_maps_constants.dart';
import 'package:ecogo_mobile_app/data/navigation/destination.dart';
import 'package:ecogo_mobile_app/services/location_service.dart';
import 'package:ecogo_mobile_app/services/navigation_service.dart';
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
  final NavigationService _navigationService = NavigationService();
  // final Location _location = Location();
  late String _mapStyle;
  late Position _userLocation;
  late Position _userTempLocation;
  bool arrived = false;
  bool firstTimefetch = true;
  bool firstTimeUpdate = true;
  late Marker _userLocationMarker;
  late BitmapDescriptor _userIcon;

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
    Uint8List customMarker =
        await getBytesFromAsset("assets/icons/navigation_avatar.png", 130);
    _userLocation = await _locationService.determinePosition();
    GoogleMapController controller = await _controller.future;
    if (checked) {
      _calculateDistance();
    }
    if (firstTimefetch) {
      firstTimefetch = false;
      _userLocationMarker = Marker(
        anchor: Offset(0, 0.5),
        markerId: MarkerId('user-location'),
        position: LatLng(_userLocation.latitude, _userLocation.longitude),
        icon: BitmapDescriptor.fromBytes(customMarker),
      );
      setState(() {
        markers.add(_userLocationMarker);
      });
    }
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
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
      color: Color(0xFFF8B62D),
      points: polylineCoordinates,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      width: 3,
    );
    if (mounted) {
      setState(() {
        polylines[id] = polyline;
      });
    }
  }

  void startTracking() async {
    Uint8List customMarker =
        await getBytesFromAsset("assets/icons/navigation_avatar.png", 130);
    GoogleMapController controller = await _controller.future;
    if (firstTimeUpdate) {
      firstTimeUpdate = false;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(_userLocation.latitude, _userLocation.longitude),
            zoom: 18),
      ));
    }
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      _userTempLocation = position;
      setState(() {
        markers.add(Marker(
          anchor: Offset(0, 0.5),
          markerId: MarkerId('user-location'),
          position: LatLng(position.latitude, position.longitude),
          icon: BitmapDescriptor.fromBytes(customMarker),
        ));
      });

      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target:
                LatLng(_userTempLocation.latitude, _userTempLocation.longitude),
            zoom: 18),
      ));
      double remainingDistance = _navigationService.coordinateDistance(
          _userTempLocation.latitude,
          _userTempLocation.longitude,
          widget.destination.location.latitude,
          widget.destination.location.longitude);

      if (remainingDistance < 0.03 && !arrived) {
        arrived = true;
        _showDialog(context);
      }
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
      myLocationEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: _initialcameraposition),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 12),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        title: Text(
          "Congrats",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You arrived at " + widget.destination.name + " !"),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF466BE4),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
              child: Text(
                "Claim your reward",
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    ).then((value) => stopTracking());
  }
}
