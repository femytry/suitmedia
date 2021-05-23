import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:suitmedia/app/controllers/event_controller.dart';

class MapFragment extends StatefulWidget {
  MapFragment({Key? key}) : super(key: key);

  @override
  _MapFragmentState createState() => _MapFragmentState();
}

class _MapFragmentState extends State<MapFragment> {
  late GoogleMapController mapController;
  final EventController _eventController = Get.find();

  final LatLng _center = const LatLng(-6.935491, 107.659588);
  final Map<String, Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _markers.clear();
      _eventController.events.forEach((element) {
        var marker = Marker(
            markerId: MarkerId(element.id.toString()),
            position:
            LatLng(element.lat ?? -6.900755, element.lng ?? 107.618706));
        _markers[element.id.toString()] = marker;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 15.0),
            markers: _markers.values.toSet(),
          ),
        ],
      ),
    );
  }
}
