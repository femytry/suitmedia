
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia/app/controllers/event_guest_controller.dart';
import 'package:suitmedia/app/controllers/guests_controller.dart';
import 'package:suitmedia/app/data/remote/models/list_guest_response.dart';
import 'package:suitmedia/app/data/remote/models/process_state.dart';
import 'package:suitmedia/app/utils/utils.dart';
import 'package:suitmedia/app/views/widget/loading.dart';

class FourthScreen extends StatelessWidget {
  static const String route = '/fourth';
  final EventGuestController _eventGuestController = Get.find();
  final GuestsController _guestsController = Get.put(GuestsController());
  final ScrollController _scrollController = ScrollController();
  static const offsetVisibleThreshold = 200;

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(_onScroll);
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
                return CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    Obx(() {
                      var items = _guestsController.guestsResponse;
                      return SliverGrid.count(
                        crossAxisCount: 2,
                        children: List.generate(
                            items.length, (index) => _gridItem(items[index])),
                      );
                    }),
                    SliverToBoxAdapter(
                      child: Obx(() {
                        var isLoading =
                            _guestsController.nextProcessState.value;
                        if (isLoading == ProcessState.LOADING) {
                          return Column(
                            children: [
                              Center(
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: Get.theme.primaryColor,
                                    ),
                                  ),),
                              SizedBox(height: 32,)
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              Center(child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(isLoading.message ?? ''),
                              )),
                              SizedBox(height: 32,)
                            ],
                          );
                        }
                      }),
                    )
                  ],
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          size: 104,
                          color: Get.theme.primaryColor,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(processState.message.toString(), style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
                        SizedBox(
                          height: 16,
                        ),
                        ElevatedButton.icon(onPressed: (){
                          _refreshData();
                        }, icon: Icon(Icons.refresh, color: Colors.white,), label: Text('Muat Ulang'),)
                      ],
                    ),
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

  Widget _gridItem(GuestData item) {
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
          Text(
            '${item.firstName} ${item.lastName}',
            style: TextStyle(fontSize: 18),
          ),
          Text(Utils.isPrimeNumber(item.id ?? 0)
              ? '(ID Prime)'
              : '(ID Not Prime)'),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _guestsController.getNextGuests();
    }
  }
}
