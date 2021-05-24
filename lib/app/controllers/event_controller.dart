import 'package:get/get.dart';
import 'package:suitmedia/app/data/dummy/dummy_event.dart';

class EventController extends GetxController {
  var events = List<DummyEvent>.empty(growable: true).obs;
  var fragmentPosition = 0.obs;

  void getEvents() {
    events.clear();
    events.add(
      DummyEvent(
        id: 1,
        name: 'Fireworks Festival',
        date: '2021-07-14',
        image: 'https://source.unsplash.com/gdTxVSAE5sk/640x425',
        lat: -6.935491,
        lng: 107.659588,
      ),
    );
    events.add(
      DummyEvent(
        id: 2,
        name: 'Live Music Performance',
        date: '2021-08-19',
        image: 'https://source.unsplash.com/aWXVxy8BSzc/400x275',
        lat: -6.936030,
        lng: 107.654815,
      ),
    );
    events.add(DummyEvent(
      id: 3,
      name: 'Beach Wedding',
      date: '2021-09-14',
      image: 'https://source.unsplash.com/GdwWrLHdwpw/640x382',
      lat: -6.944126,
      lng: 107.653015,
    ));
    events.add(DummyEvent(
      id: 4,
      name: 'Birthday Party',
      date: '2021-11-07',
      image: 'https://source.unsplash.com/cK6ixOQx1fI/640x359',
      lat: -6.945937,
      lng: 107.660536,
    ));
    events.add(DummyEvent(
      id: 5,
      name: 'Lantern Festival',
      date: '2021-11-09',
      image: 'https://source.unsplash.com/AXJDbag8tSk/640x800',
      lat: -6.929493,
      lng: 107.664163,
    ));
    events.add(DummyEvent(
      id: 6,
      name: 'Traditional Festival',
      date: '2021-12-02',
      image: 'https://source.unsplash.com/1xaful0wKZ0/640x426',
      lat: -6.939174,
      lng: 107.664119,
    ));
  }

  //0 for list event, 1 for map
  void changeFragment(int position) {
    fragmentPosition(position);
  }
}
