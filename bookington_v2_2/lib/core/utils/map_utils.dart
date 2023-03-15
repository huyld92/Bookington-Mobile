import 'package:bookington_v2_2/core/app_export.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class MapUtil {
  static Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("title",
          'Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("title", 'Location permissions are denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("title",
          'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  }

  static Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      print("location: ${position.toString()}");

      Map<String, String?> positionAddress =
          await _getAddressFromLatLng(position);
      print(positionAddress.toString());
    }).catchError((e) {
      print(e);
    });
  }

  static Future<Map<String, String?>> _getAddressFromLatLng(
      Position currentPosition) async {
    Map<String, String?> position = {
      "districtName": null,
      "provinceName": null,
    };
    await placemarkFromCoordinates(
            currentPosition.latitude, currentPosition.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      position = {
        "districtName": place.subAdministrativeArea,
        "provinceName": place.administrativeArea,
      };
    }).catchError((e) {
      print(e);
    });
    return position;
  }
}
