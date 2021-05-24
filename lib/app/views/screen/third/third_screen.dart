import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia/app/controllers/event_controller.dart';
import 'package:suitmedia/app/views/screen/third/event_fragment.dart';
import 'package:suitmedia/app/views/screen/third/map_fragment.dart';

class ThirdScreen extends StatelessWidget {
  static const String route = '/third';
  final EventController _eventController = Get.put(EventController());

  final _body = [EventFragment(), MapFragment()];

  @override
  Widget build(BuildContext context) {
    _eventController.getEvents();
    return Scaffold(
        appBar: AppBar(
          title: Text('EVENTS'),
          leading: InkWell(
            child: Image.asset('assets/images/ic_back_white.png'),
            onTap: () {
              Get.back();
            },
            customBorder: CircleBorder(),
          ),
          actions: [
            InkWell(
              child: Image.asset('assets/images/ic_search_white.png'),
              onTap: () {
              },
              customBorder: CircleBorder(),
            ),
            Obx(() {
              var asset = 'assets/images/ic_map_view.png';
              var pos = _eventController.fragmentPosition.value;
              if (pos == 1) {
                asset = 'assets/images/ic_list_view.png';
              }
              return InkWell(
                child: Image.asset(asset),
                onTap: () {
                  _eventController.changeFragment(pos == 0 ? 1 : 0);
                },
                customBorder: CircleBorder(),
              );
            })
          ],
        ),
        body: Obx(() {
          var position = _eventController.fragmentPosition.value;
          return _body[position];
        }));
  }
}
