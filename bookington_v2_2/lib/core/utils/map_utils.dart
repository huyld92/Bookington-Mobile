// ignore_for_file: avoid_print

import 'package:bookington_v2_2/core/app_export.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class MapUtils {
  MapUtils() {
    getCurrentPosition();
  }

  Future<void> init() async {
    getCurrentPosition();
   }

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

  static Future<Map<String, String?>> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    Map<String, String?> positionAddress = {
      "districtName": null,
      "provinceName": null,
    };
    if (!hasPermission) {
      return positionAddress;
    }
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      positionAddress = await _getAddressFromLatLng(position);
    }).catchError((e) {
      print(e);
    });
    return positionAddress;
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
