class DummyEvent {
  int? _id;
  String? _name;
  String? _date;
  String? _image;
  double? _lat;
  double? _lng;

  int? get id => _id;
  String? get name => _name;
  String? get date => _date;
  String? get image => _image;
  double? get lat => _lat;
  double? get lng => _lng;

  DummyEvent({
      int? id,
      String? name, 
      String? date, 
      String? image,
    double? lat,
    double? lng,
  }){
    _id = id;
    _name = name;
    _date = date;
    _image = image;
    _lat = lat;
    _lng = lng;
}

  DummyEvent.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _date = json["date"];
    _image = json["image"];
    _lat = json["lat"];
    _lng = json["lng"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["date"] = _date;
    map["image"] = _image;
    map["lat"] = _lat;
    map["lng"] = _lng;
    return map;
  }
}