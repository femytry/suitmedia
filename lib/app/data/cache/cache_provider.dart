import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:suitmedia/app/data/remote/models/list_guest_response.dart';
import 'package:suitmedia/app/utils/consts.dart';

class CacheProvider{

  static var _dataStorage = GetStorage();

  static void setGuestListCache(List<GuestData> guestsResponse){
    _dataStorage.write(CONSTS.CACHE_GUEST, jsonEncode(guestsResponse));
  }

  static List<GuestData> getGuestListCache(){
    var json = _dataStorage.read(CONSTS.CACHE_GUEST);
    var data = List<GuestData>.empty(growable: true);
    if (json != null) {
      jsonDecode(json).forEach((v) {
        data.add(GuestData.fromJson(v));
      });
    }
    return data;
  }
}