import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:suitmedia/app/controllers/event_controller.dart';
import 'package:suitmedia/app/controllers/event_guest_controller.dart';
import 'package:suitmedia/app/data/dummy/dummy_event.dart';
import 'package:suitmedia/app/utils/time_utils.dart';

class EventFragment extends StatelessWidget {

  final EventController _eventController = Get.find();
  final EventGuestController _eventGuestController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      var events = _eventController.events;
      return ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          var item = events[index];
          return _listItem(item);
        },
      );
    }));
  }


  Widget _listItem(DummyEvent item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
    );
  }
}
