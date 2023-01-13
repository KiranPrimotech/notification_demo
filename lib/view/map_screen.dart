import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controller/map_controller.dart';


class  MapScreen extends StatelessWidget{
  MapController controlle =Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: controlle.kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            controlle.controller.complete(controller);
          },
        ),

        floatingActionButton: FloatingActionButton.extended(
          onPressed: controlle.goToTheLake,
          label: Text('To the lake!'),
          icon: Icon(Icons.directions_boat),
        ),

      ),
    );
  }



}