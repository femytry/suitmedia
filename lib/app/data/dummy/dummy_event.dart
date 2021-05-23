class DummyEvent {
  int? _id;
  String? _name;
  String? _date;
  String? _image;

  int? get id => _id;
  String? get name => _name;
  String? get date => _date;
  String? get image => _image;

  DummyEvent({
      int? id,
      String? name, 
      String? date, 
      String? image}){
    _id = id;
    _name = name;
    _date = date;
    _image = image;
}

  DummyEvent.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _date = json["date"];
    _image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["date"] = _date;
    map["image"] = _image;
    return map;
  }

}