class ProductModel {
  int? id;
  String? name;
  String? description;
  String? category;
  int? price;
  String? store;
  int? stock;
  String? image;

  ProductModel({this.id, this.name, this.description, this.category, this.price, this.store, this.stock, this.image});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["category"] is String) {
      category = json["category"];
    }
    if(json["price"] is int) {
      price = json["price"];
    }
    if(json["store"] is String) {
      store = json["store"];
    }
    if(json["stock"] is int) {
      stock = json["stock"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
  }

  static List<ProductModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProductModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["description"] = description;
    _data["category"] = category;
    _data["price"] = price;
    _data["store"] = store;
    _data["stock"] = stock;
    _data["image"] = image;
    return _data;
  }
}