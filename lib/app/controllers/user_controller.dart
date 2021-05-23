import 'package:get/get.dart';

class UserController extends GetxController{
  var userName = "".obs;

  void setName(String? name){
    userName(name);
  }
}