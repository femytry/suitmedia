import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:suitmedia/app/data/dummy/dummy_event.dart';

class MapXController extends GetxController{
  var markers = Map<String, Marker>().obs;

  void setMarkers(List<DummyEvent> events, int position){
    markers.clear();
    events.asMap().forEach((index, element) async {
      var asset = 'assets/images/ic_marker_unselected.png';
      if (index == position) {
        asset = 'assets/images/ic_marker_selected.png';
      }
      var pinMapIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5), asset);
      var marker = Marker(
          markerId: MarkerId(element.id.toString()),
          position: LatLng(element.lat ?? -6.900755, element.lng ?? 107.618706),
        icon: pinMapIcon
      );

      markers[element.id.toString()] = marker;
    });
  }
}