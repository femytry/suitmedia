
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia/app/controllers/event_guest_controller.dart';
import 'package:suitmedia/app/controllers/user_controller.dart';
import 'package:suitmedia/app/utils/colors.dart';
import 'package:suitmedia/app/views/screen/fourth/fourth_screen.dart';
import 'package:suitmedia/app/views/screen/third/third_screen.dart';

class SecondScreen extends StatelessWidget {
  static const String route = '/second';
  final UserController _userController = Get.find();
  final EventGuestController _eventGuestController = Get.put(EventGuestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.1), BlendMode.overlay),
                      image: AssetImage('assets/images/bg_bright.png'))),
            ),
            Column(
              children: [
                SizedBox(
                  height: 48,
                ),
                _header(),
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(ThirdScreen.route);
                    },
                    child: Obx(() {
                      var event = _eventGuestController.selectedEvent.value;
                      if (event.name != null) {
                        return Text(
                          event.name ?? '',
                          style: TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        );
                      } else {
                        return Text(
                          'Choose Event',
                          style: TextStyle(color: Colors.white),
                        );
                      }
                    }),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: ElevatedButton(
                    onPressed: _handleReturnData,
                    child: Obx(() {
                      var guest = _eventGuestController.selectedGuest.value;
                      if (guest.id != null) {
                        return Text(
                          '${guest.firstName} ${guest.lastName}',
                          style: TextStyle(color: Colors.white),
                        );
                      }else{
                        return Text(
                          'Choose Guest',
                          style: TextStyle(color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        );
                      }
                    }),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Image.asset('assets/images/img_suitmedia.png'),
                  ),
                ),
                Image.asset('assets/images/img_bg_bottom.png')
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _header() => Padding(
    padding: const EdgeInsets.only(left: 32),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hallo,',
              style: TextStyle(
                  fontSize: 28, color: COLORS.TEXT_GREY),
            ),
            Obx(
                  () {
                var name = _userController.userName.value;
                return Text(
                  name,
                  style: TextStyle(
                      fontSize: 28,
                      color: Get.theme.primaryColor,
                      fontWeight: FontWeight.bold),
                );
              },
            )
          ],
        ),
        SizedBox(
          width: 32,
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Container(
                  height: 2,
                  width: double.infinity,
                  color: Get.theme.primaryColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 2,
                width: double.infinity,
                color: Get.theme.primaryColor,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Container(
                  height: 2,
                  width: double.infinity,
                  color: Get.theme.primaryColor,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );

  _handleReturnData() async{
    var data = await Get.toNamed(FourthScreen.route);
    if (data == true) {
      var guest = _eventGuestController.selectedGuest.value;
      if (guest.id != null) {
        if (guest.id! % 3 == 0 && guest.id! % 2 == 0) {
          Get.snackbar('Phone', 'iOS', duration: Duration(seconds: 2));
        } else if (guest.id! % 3 == 0) {
          Get.snackbar('Phone', 'Android', duration: Duration(seconds: 2));
        } else if (guest.id! % 2 == 0) {
          Get.snackbar('Phone', 'Blackberry', duration: Duration(seconds: 2));
        } else {
          Get.snackbar('Phone', 'Feature Phone', duration: Duration(seconds: 2));
        }
      }
    }
  }
}
