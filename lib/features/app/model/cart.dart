
import 'package:delivery_app/features/app/model/product.dart';

class CartModel 
{
  List<ProductModel>? products;
  int? totalPrice;

  CartModel({this.products, this.totalPrice});

  CartModel.fromJson(Map<String, dynamic> json) {
    if(json["products"] is List) {
      products = json["products"] == null ? null : (json["products"] as List).map((e) => ProductModel.fromJson(e)).toList();
    }
    if(json["total_price"] is int) {
      totalPrice = json["total_price"];
    }
  }

  static List<CartModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(products != null) {
      data["products"] = products;
    }
    data["total_price"] = totalPrice;
    return data;
  }
}