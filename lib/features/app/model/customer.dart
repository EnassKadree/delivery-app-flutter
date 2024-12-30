
class CustomerModel {
  String? firstName;
  String? lastName;
  String? image;
  String? phone;
  String? address;

  CustomerModel({this.firstName, this.lastName, this.image, this.phone, this.address});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    if (json["first_name"] is String) {
      firstName = json["first_name"];
    }
    if (json["last_name"] is String) {
      lastName = json["last_name"];
    }
    if (json["image"] == null || json["image"] is String) {
      image = json["image"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["address"] is String) {
      address = json["address"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["first_name"] = firstName;
    _data["last_name"] = lastName;
    _data["image"] = image;
    _data["phone"] = phone;
    _data["address"] = address;
    return _data;
  }
}
