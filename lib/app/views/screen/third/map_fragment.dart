import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:suitmedia/app/controllers/event_controller.dart';
import 'package:suitmedia/app/controllers/event_guest_controller.dart';
import 'package:suitmedia/app/controllers/mapx_controller.dart';
import 'package:suitmedia/app/data/dummy/dummy_event.dart';
import 'package:suitmedia/app/utils/time_utils.dart';

class MapFragment extends StatefulWidget {
  MapFragment({Key? key}) : super(key: key);

  @override
  _MapFragmentState createState() => _MapFragmentState();
}

class _MapFragmentState extends State<MapFragment> {
  String? _mapStyle;
  late GoogleMapController mapController;
  final EventController _eventController = Get.find();
  final EventGuestController _eventGuestController = Get.find();
  final MapXController _mapXController = Get.put(MapXController());

  final LatLng _center = const LatLng(-6.935491, 107.659588);

  @override
  void initState() {
    super.initState();
    rootBundle
        .loadString('assets/map_style.txt')
        .then((value) => _mapStyle = value);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _mapXController.setMarkers(_eventController.events, 0);
    mapController.setMapStyle(_mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      var items = _eventController.events;
      return Stack(
        children: [
          Obx(() {
            var markers = _mapXController.markers;
            return GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition:
                  CameraPosition(target: _center, zoom: 15.0),
              markers: markers.values.toSet(),
            );
          }),
          CarouselSlider(
              items: _listItem(items),
              options: CarouselOptions(
                autoPlay: false,
                viewportFraction: 0.9,
                height: 144,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  var events = _eventController.events;
                  _mapXController.setMarkers(events, index);
                  mapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: LatLng(events[index].lat ?? -6.900755,
                              events[index].lng ?? 107.618706), zoom: 15),
                    ),
                  );
                },
              ))
        ],
      );
    }));
  }

  List<Widget> _listItem(List<DummyEvent> items) {
    return items
        .map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {
                    _eventGuestController.selectEvent(item);
                    Get.back();
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: item.image ?? '',
                          height: 144,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          height: 144,
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                item.name ?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Expanded(child: Container()),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  TimeUtils.formatDate(item.date ?? ''),
                                ),
                              )
                            ],
                          ),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ))
        .toList();
  }
}
