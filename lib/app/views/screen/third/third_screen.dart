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
                _eventController.changeFragment(0);
              },
              customBorder: CircleBorder(),
            ),
            InkWell(
              child: Image.asset('assets/images/ic_map_view.png'),
              onTap: () {
                _eventController.changeFragment(1);
              },
              customBorder: CircleBorder(),
            ),
          ],
        ),
        body: Obx(() {
          var position = _eventController.fragmentPosition.value;
          return _body[position];
        }));
  }
}
