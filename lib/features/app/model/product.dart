class ProductModel
{
  int? id;
  String? name;
  String? description;
  String? category;
  int? price;
  String? store;
  String? storeImage;
  int? quantity;
  int? stock;
  String? image;
  bool? isInCart;
  bool? isFavorite;

  ProductModel({this.id, this.name, this.description, this.category, this.price, this.store, this.storeImage, this.stock,this.quantity, this.image, this.isInCart, this.isFavorite});

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
    if(json["store_image"] is String) {
      storeImage = json["store_image"];
    }
    if(json["stock"] is int) {
      stock = json["stock"];
    }
    if(json["quantity"] is int) {
      quantity = json["quantity"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["isInCart"] is bool) {
      isInCart = json["isInCart"];
    }
    if(json["isFavorite"] is bool) {
      isFavorite = json["isFavorite"];
    }
  }

  static List<ProductModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProductModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["category"] = category;
    data["price"] = price;
    data["store"] = store;
    data["store_image"] = storeImage;
    data["stock"] = stock;
    data["quantity"] = quantity;
    data["image"] = image;
    data["isInCart"] = isInCart;
    data["isFavorite"] = isFavorite;
    return data;
  }
}