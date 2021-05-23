
import 'package:get/get.dart';
import 'package:suitmedia/app/data/cache/cache_provider.dart';
import 'package:suitmedia/app/data/remote/api/repositories/guest_repository.dart';
import 'package:suitmedia/app/data/remote/models/list_guest_response.dart';
import 'package:suitmedia/app/data/remote/models/process_state.dart';

class GuestsController extends GetxController {
  var guestsResponse = List<GuestData>.empty(growable: true).obs;
  var processState = ProcessState().obs;
  var nextProcessState = ProcessState().obs;
  var page = 1;

  void getFirstGuests() {
    page = 1;
    processState(ProcessState.LOADING);
    GuestRepository().getGuest(page).then((value) {
      if (value.data != null && value.data!.isNotEmpty) {
        processState(ProcessState.LOADED);
        guestsResponse(value.data);
        CacheProvider.setGuestListCache(guestsResponse);
      } else {
        processState(ProcessState.error('Nothing here...'));
      }
    }, onError: (error){
      var data = CacheProvider.getGuestListCache();
      if (data.isEmpty) {
        processState(ProcessState.error(error.toString()));
      }else{
        processState(ProcessState.LOADED);
        guestsResponse(data);
      }
    });
  }

  void getNextGuests() {
    nextProcessState(ProcessState.LOADING);
    GuestRepository().getGuest(page+1).then((value) {
      page++;
      nextProcessState(ProcessState.LOADED);
      guestsResponse.addAll(value.data!);
      CacheProvider.setGuestListCache(guestsResponse);
    }, onError: (error){
      nextProcessState(ProcessState.error(error.toString()));
    });
  }
}
