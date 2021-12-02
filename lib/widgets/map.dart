import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:ecogo_mobile_app/services/location_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  MapState createState() => MapState();
}

class MapState extends State<Map> {
  final Completer<GoogleMapController> _controller = Completer();
  final LocationService _locationService = LocationService();
  late String _mapStyle;
  late Position _userLocation;
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  Set<Marker> _markers = {};
  late Marker _userLocationMarker;
  late BitmapDescriptor _userIcon;
  bool firstTimeFetch = true;
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 1,
  );
  late StreamSubscription<Position> positionStream;
  double _directon = 0.0;

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(_mapStyle);
    _controller.complete(controller);
  }

  Future<GoogleMapController> _getController() async {
    return await _controller.future;
  }

  void getCurrentLocation() async {
    // _userLocation = await _locationService.getLocation();
    Uint8List customMarker =
        await getBytesFromAsset("assets/icons/navigation_avatar.png", 130);
    _userLocation = await _locationService.determinePosition();
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
          target: LatLng(_userLocation.latitude, _userLocation.longitude),
          zoom: 15),
    ));
    if (firstTimeFetch) {
      firstTimeFetch = false;
      _userLocationMarker = Marker(
        anchor: Offset(0, 0.5),
        markerId: MarkerId('user-location'),
        position: LatLng(_userLocation.latitude, _userLocation.longitude),
        icon: BitmapDescriptor.fromBytes(customMarker),
      );
      setState(() {
        _markers.add(_userLocationMarker);
      });

      positionStream =
          Geolocator.getPositionStream(locationSettings: locationSettings)
              .listen((Position position) {
        Marker element = Marker(
            anchor: Offset(0, 0.5),
            markerId: MarkerId('user-location'),
            position: LatLng(position.latitude, position.longitude),
            icon: BitmapDescriptor.fromBytes(customMarker));
        setState(() {
          _markers.add(element);
        });
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

  void disposeController() async {
    GoogleMapController controller = await _controller.future;
    controller.dispose();
  }

  void getMarker() async {}
  // @override
  // void dispose() {
  //   super.dispose();
  //   disposeController();
  // }

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/map_style_2.txt').then((string) {
      _mapStyle = string;
    });
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: _onMapCreated,
      markers: _markers,
      initialCameraPosition: CameraPosition(target: _initialcameraposition),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 12),
    );
  }
}
