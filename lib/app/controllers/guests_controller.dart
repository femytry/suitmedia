import 'package:get/get.dart';
import 'package:suitmedia/app/data/remote/api/repositories/guest_repository.dart';
import 'package:suitmedia/app/data/remote/models/list_guest_response.dart';
import 'package:suitmedia/app/data/remote/models/process_state.dart';

class GuestsController extends GetxController {
  var guestsResponse = List<Data>.empty(growable: true).obs;
  var processState = ProcessState().obs;
  var page = 1;

  void getFirstGuests() {
    page = 1 ;
    processState(ProcessState.LOADING);
    GuestRepository().getGuest(page).then((value) {
      processState(ProcessState.LOADED);
      guestsResponse(value.data);
    }, onError: (error){
      processState(ProcessState.error(error.toString()));
      if (Get.isDialogOpen == null || !Get.isDialogOpen!) {
        Get.defaultDialog(title: "Something Wrong", middleText: error.toString());
      }
    });
  }

  void getNextGuests() {
    GuestRepository().getGuest(++page).then((value) {
      guestsResponse.addAll(value.data!);
    }, onError: (error){
      processState(ProcessState.error(error.toString()));
      if (Get.isDialogOpen == null || !Get.isDialogOpen!) {
        Get.defaultDialog(title: "Something Wrong", middleText: error.toString());
      }
    });
  }
}
