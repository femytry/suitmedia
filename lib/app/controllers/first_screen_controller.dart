import 'package:get/get.dart';

class FirstScreenController extends GetxController{
  var nameError = false.obs;
  var textError = false.obs;

  var nameMessage = ''.obs;
  var textMessage = ''.obs;

  void setNameError(String message){
    nameError(true);
    nameMessage(message);
  }

  void noNameError(){
    nameError(false);
    nameMessage('');
  }

  void setTextError(String message){
    textError(true);
    textMessage(message);
  }

  void noTextError(){
    textError(false);
    textMessage('');
  }
}