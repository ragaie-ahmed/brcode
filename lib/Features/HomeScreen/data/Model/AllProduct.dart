import 'package:hive/hive.dart';
part 'AllProduct.g.dart';
@HiveType(typeId: 0)
class AllProduct extends HiveObject {
  AllProduct({
    this.id,
    this.title,
    this.barcode,
    this.description,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  AllProduct.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    barcode = json['barcode'];
    description = json['description'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  @HiveField(0)
  num? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? barcode;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? price;
  @HiveField(5)
  String? createdAt;
  @HiveField(6)
  String? updatedAt;

  AllProduct copyWith({
    num? id,
    String? title,
    String? barcode,
    String? description,
    String? price,
    String? createdAt,
    String? updatedAt,
  }) =>
      AllProduct(
        id: id ?? this.id,
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
