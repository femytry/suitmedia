
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:suitmedia/app/controllers/event_guest_controller.dart';
import 'package:suitmedia/app/controllers/guests_controller.dart';
import 'package:suitmedia/app/data/remote/models/list_guest_response.dart';
import 'package:suitmedia/app/data/remote/models/process_state.dart';
import 'package:suitmedia/app/views/widget/loading.dart';

class FourthScreen extends StatelessWidget {
  static const String route = '/fourth';
  final EventGuestController _eventGuestController = Get.find();
  final GuestsController _guestsController = Get.put(GuestsController());

  @override
  Widget build(BuildContext context) {
    _guestsController.getFirstGuests();
    return Scaffold(
      appBar: AppBar(
        title: Text('GUESTS'),
        leading: InkWell(
          child: Image.asset('assets/images/ic_back_white.png'),
          onTap: () {
            Get.back();
          },
          customBorder: CircleBorder(),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: Obx(
            () {
              var processState = _guestsController.processState.value;
              if (processState == ProcessState.LOADING) {
                return Loading();
              } else if (processState == ProcessState.LOADED) {
                return LazyLoadScrollView(
                  onEndOfPage: _guestsController.getNextGuests,
                  child: Obx(() {
                    var items = _guestsController.guestsResponse;
                    return GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(items.length, (index) =>
                          _gridItem(items[index])),
                    );
                  }
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.error, size: 64,),
                      SizedBox(height: 16,),
                      Text(processState.message.toString())
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future _refreshData() async {
    _guestsController.getFirstGuests();
  }

  Widget _gridItem(Data item) {
    return InkWell(
      onTap: () {
        _eventGuestController.selectGuest(item);
        Get.back(result: true);
      },
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(item.avatar ?? ''),
                radius: 64,
              ),
            ),
          ),
          Text('${item.firstName} ${item.lastName}', style: TextStyle(fontSize: 18),),
          SizedBox(height: 16,)
        ],
      ),
    );
  }
}
