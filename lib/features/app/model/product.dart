class ProductModel
{
  int? id;
  String? name;
  String? description;
  String? category;
  int? price;
  String? store;
  String? storeImage;
  int? stock;
  String? image;
  bool? isInCart;
  bool? isFavorite;

  ProductModel({this.id, this.name, this.description, this.category, this.price, this.store, this.storeImage, this.stock, this.image, this.isInCart, this.isFavorite});

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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["description"] = description;
    _data["category"] = category;
    _data["price"] = price;
    _data["store"] = store;
    _data["store_image"] = storeImage;
    _data["stock"] = stock;
    _data["image"] = image;
    _data["isInCart"] = isInCart;
    _data["isFavorite"] = isFavorite;
    return _data;
  }
}