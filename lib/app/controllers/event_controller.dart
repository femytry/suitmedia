import 'package:get/get.dart';
import 'package:suitmedia/app/data/dummy/dummy_event.dart';

class EventController extends GetxController {
  var events = List<DummyEvent>.empty(growable: true).obs;

  void getEvents() {
    events.clear();
    events.add(DummyEvent(
        id: 1,
        name: 'Fireworks Festival',
        date: '2021-07-14',
        image:
            'https://source.unsplash.com/gdTxVSAE5sk/640x425'));
    events.add(DummyEvent(
        id: 2,
        name: 'Live Music Performance',
        date: '2021-08-19',
        image:
            'https://source.unsplash.com/aWXVxy8BSzc/400x275'));
    events.add(DummyEvent(
        id: 3,
        name: 'Beach Wedding',
        date: '2021-09-14',
        image:
            'https://source.unsplash.com/GdwWrLHdwpw/640x382'));
    events.add(DummyEvent(
        id: 4,
        name: 'Birthday Party',
        date: '2021-11-07',
        image:
            'https://source.unsplash.com/cK6ixOQx1fI/640x359'));
    events.add(DummyEvent(
        id: 5,
        name: 'Lantern Festival',
        date: '2021-11-09',
        image:
            'https://source.unsplash.com/AXJDbag8tSk/640x800'));
    events.add(DummyEvent(
        id: 6,
        name: 'Traditional Festival',
        date: '2021-12-02',
        image:
            'https://source.unsplash.com/1xaful0wKZ0/640x426'));
  }
}
