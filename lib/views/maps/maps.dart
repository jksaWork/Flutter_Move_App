import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:movies_app/controllers/maps/google_map_controller.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CustomGoogleMapController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
      ),
      body: GetBuilder<CustomGoogleMapController>(builder: (controller) {
        return GoogleMap(
          initialCameraPosition: controller.kGooglePlex,
          markers: controller.markers,
          onTap: (LatLng lat) {
            controller.append(lat);
          },
          onMapCreated: (GoogleMapController googleMapController) {
            controller.oncreated();
          },
        );
      }),
    );
  }
}
