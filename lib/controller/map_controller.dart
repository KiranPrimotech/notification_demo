import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapController extends GetxController {
  Completer<GoogleMapController> controller = Completer();
  late Position position;

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  @override
  void onInit() {
    requestPermission();
    getCurrentLocation();

    super.onInit();
  }

  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(30.7270, 176.7199),
    zoom: 14.4746,
  );

  static final CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Future<void> goToTheLake() async {
    final GoogleMapController mapcontroller = await controller.future;
    mapcontroller.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }

  Future<String> requestPermission() async {
    if (await Permission.location.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      print("Location Permission is granted");
      return "true";
    } else {
      print("Location Permission is denied.");
      return "false";
    }
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print(
        "current location position ---- ${position.longitude} --- ${position.latitude}");

    final GoogleMapController mapcontroller = await controller.future;
    mapcontroller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        bearing: 192.8334901395799,
        tilt: 59.440717697143555,
        zoom: 19.151926040649414)));
  }
// User

}