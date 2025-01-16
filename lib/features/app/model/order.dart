class OrderModel {
  int? id;
  String? status;
  double? totalPrice;
  String? address;
  int? customerId;
  DateTime? createdAt;
  DateTime? updatedAt;

  OrderModel({
    this.id,
    this.status,
    this.totalPrice,
    this.address,
    this.customerId,
    this.createdAt,
    this.updatedAt,
  });

  // Constructor to parse JSON into an OrderModel
  OrderModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["total_price"] is num) {
      totalPrice = json["total_price"].toDouble();
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["customer_id"] is int) {
      customerId = json["customer_id"];
    }
    if (json["date"] != null && json["date"] is String) {
      createdAt = DateTime.tryParse(json["date"]);
    }
    if (json["updated_at"] != null && json["updated_at"] is String) {
      updatedAt = DateTime.tryParse(json["updated_at"]);
    }
  }

  // Static method to parse a list of JSON objects into a list of OrderModel
  static List<OrderModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((json) => OrderModel.fromJson(json)).toList();
  }

  // Convert OrderModel to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["status"] = status;
    data["total_price"] = totalPrice;
    data["address"] = address;
    data["customer_id"] = customerId;
    data["created_at"] = createdAt?.toIso8601String();
    data["updated_at"] = updatedAt?.toIso8601String();
    return data;
  }
}