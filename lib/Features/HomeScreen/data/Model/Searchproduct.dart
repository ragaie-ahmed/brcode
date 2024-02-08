class Searchproduct {
  Searchproduct({
      this.id, 
      this.title, 
      this.barcode, 
      this.description, 
      this.price, 
      this.createdAt, 
      this.updatedAt,});

  Searchproduct.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    barcode = json['barcode'];
    description = json['description'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? title;
  String? barcode;
  String? description;
  String? price;
  String? createdAt;
  String? updatedAt;
Searchproduct copyWith({  num? id,
  String? title,
  String? barcode,
  String? description,
  String? price,
  String? createdAt,
  String? updatedAt,
}) => Searchproduct(  id: id ?? this.id,
  title: title ?? this.title,
  barcode: barcode ?? this.barcode,
  description: description ?? this.description,
  price: price ?? this.price,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['barcode'] = barcode;
    map['description'] = description;
    map['price'] = price;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}