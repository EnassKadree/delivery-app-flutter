class StoreModel {
  int? id;
  String? name;
  String? address;
  dynamic image;

  StoreModel({this.id, this.name, this.address, this.image});

  StoreModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["address"] is String) {
      address = json["address"];
    }
    image = json["image"];
  }

  static List<StoreModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(StoreModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["address"] = address;
    _data["image"] = image;
    return _data;
  }
}