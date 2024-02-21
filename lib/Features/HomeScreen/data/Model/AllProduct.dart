import 'package:hive/hive.dart';
part 'AllProduct.g.dart';
@HiveType(typeId: 0)
class AllProduct extends HiveObject {
  AllProduct({
    this.id,
    this.adminId,
    this.title,
    this.barcode,
    this.description,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  AllProduct.fromJson(dynamic json) {
    id = json['id'];
    adminId = json['admin_id'];
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
  num? adminId;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? barcode;
  @HiveField(4)
  String? description;
  @HiveField(5)
  String? price;
  @HiveField(6)
  String? createdAt;
  @HiveField(7)
  String? updatedAt;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['barcode'] = barcode;
    map['description'] = description;
    map['price'] = price;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['admin_id'] = adminId;
    return map;
  }
}
