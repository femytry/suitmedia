import 'package:get/get.dart';
import 'package:suitmedia/app/controllers/event_guest_controller.dart';
import 'package:suitmedia/app/controllers/user_controller.dart';

class AppBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(UserController());
  }

}