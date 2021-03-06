import 'package:get/get.dart';
import 'package:suitmedia/app/data/dummy/dummy_event.dart';
import 'package:suitmedia/app/data/remote/models/list_guest_response.dart';

class EventGuestController extends GetxController{
  var selectedGuest = GuestData().obs;
  var selectedEvent = DummyEvent().obs;

  void selectGuest(GuestData guest){
    selectedGuest(guest);
  }

  void selectEvent(DummyEvent event){
    selectedEvent(event);
  }
}