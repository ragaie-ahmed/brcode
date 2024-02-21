class Searchproduct {
  Searchproduct({
      this.id, 
      this.title, 
      this.barcode, 
      this.adminId, 
      this.description, 
      this.price, 
      this.createdAt, 
      this.updatedAt,});

  Searchproduct.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    barcode = json['barcode'];
    adminId = json['admin_id'];
    description = json['description'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? title;
  String? barcode;
  int? adminId;
  String? description;
  String? price;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['barcode'] = barcode;
    map['admin_id'] = adminId;
    map['description'] = description;
    map['price'] = price;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}