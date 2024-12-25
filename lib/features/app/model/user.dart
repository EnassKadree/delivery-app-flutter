
class UserModel {
  String? status;
  String? message;
  User? user;
  String? token;

  UserModel({this.status, this.message, this.user, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    if(json["Status"] is String) {
      status = json["Status"];
    }
    if(json["Message"] is String) {
      message = json["Message"];
    }
    if(json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
    if(json["token"] is String) {
      token = json["token"];
    }
  }

  static List<UserModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Status"] = status;
    _data["Message"] = message;
    if(user != null) {
      _data["user"] = user?.toJson();
    }
    _data["token"] = token;
    return _data;
  }
}

class User {
  int? id;
  String? phone;
  String? email;
  dynamic emailVerifiedAt;
  String? role;
  String? createdAt;
  String? updatedAt;

  User({this.id, this.phone, this.email, this.emailVerifiedAt, this.role, this.createdAt, this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    emailVerifiedAt = json["email_verified_at"];
    if(json["role"] is String) {
      role = json["role"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
  }

  static List<User> fromList(List<Map<String, dynamic>> list) {
    return list.map(User.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["phone"] = phone;
    _data["email"] = email;
    _data["email_verified_at"] = emailVerifiedAt;
    _data["role"] = role;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}