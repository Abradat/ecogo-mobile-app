import 'package:ecogo_mobile_app/data/user_location.dart';
import 'package:location/location.dart';

class LocationService {
  late UserLocation _currentLocation;
  Location location = Location();

  Future<LocationData?> getLocation() async {
    // try {
    //   var userLocation = await location.getLocation();
    //   _currentLocation = UserLocation(
    //     latitude: userLocation.latitude,
    //     longitude: userLocation.longitude,
    //   );
    // } on Exception catch (e) {
    //   print('Could not get location: ${e.toString()}');
    // }
    //
    // return _currentLocation;
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    _locationData = await location.getLocation();
    return _locationData;
  }
}
