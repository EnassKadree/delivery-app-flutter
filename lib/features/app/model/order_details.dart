
import 'product.dart';

class OrderDetailsModel 
{
  List<ProductModel>? products;
  OrderDetailes? orderDetailes;

  OrderDetailsModel({this.products, this.orderDetailes});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    if(json["products"] is List) {
      products = json["products"] == null ? null : (json["products"] as List).map((e) => ProductModel.fromJson(e)).toList();
    }
    if(json["order_detailes"] is Map) {
      orderDetailes = json["order_detailes"] == null ? null : OrderDetailes.fromJson(json["order_detailes"]);
    }
  }

  static List<OrderDetailsModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(OrderDetailsModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(products != null) {
      data["products"] = products?.map((e) => e.toJson()).toList();
    }
    if(orderDetailes != null) {
      data["order_detailes"] = orderDetailes?.toJson();
    }
    return data;
  }
}

class OrderDetailes {
  String? orderStatus;
  int? totalPrice;
  String? createdAt;
  String? address;

  OrderDetailes({this.orderStatus, this.totalPrice, this.createdAt, this.address});

  OrderDetailes.fromJson(Map<String, dynamic> json) {
    if(json["order_status"] is String) {
      orderStatus = json["order_status"];
    }
    if(json["total_price"] is int) {
      totalPrice = json["total_price"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["address"] is String) {
      address = json["address"];
    }
  }

  static List<OrderDetailes> fromList(List<Map<String, dynamic>> list) {
    return list.map(OrderDetailes.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["order_status"] = orderStatus;
    data["total_price"] = totalPrice;
    data["created_at"] = createdAt;
    data["address"] = address;
    return data;
  }
}
