import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  double? latitude;
  double? longitude;

  @override
  onInit() {
    getLatAndLong();
    super.onInit();
  }

  getLatAndLong() async {
    Location location = Location();

    bool _serviceEnabled;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    PermissionStatus _permissionGranted = await location.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();

      if ((_permissionGranted != PermissionStatus.granted) ||
          (_permissionGranted != PermissionStatus.grantedLimited)) {
        return;
      }
    }

    LocationData _currentPosition = await location.getLocation();

    latitude = _currentPosition.latitude;
    longitude = _currentPosition.longitude;

    print(latitude);
    print(longitude);
    print('nik');

    update();
  }
}
