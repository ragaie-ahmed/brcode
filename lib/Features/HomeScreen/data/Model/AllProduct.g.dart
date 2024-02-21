// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AllProduct.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllProductAdapter extends TypeAdapter<AllProduct> {
  @override
  final int typeId = 0;

  @override
  AllProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllProduct(
      id: fields[0] as num?,
      title: fields[1] as String?,
      barcode: fields[2] as String?,
      description: fields[3] as String?,
      price: fields[4] as String?,
      createdAt: fields[5] as String?,
      updatedAt: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AllProduct obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)

      ..writeByte(2)
      ..write(obj.barcode)

      ..writeByte(3)
      ..write(obj.description)

      ..writeByte(4)
      ..write(obj.price)

      ..writeByte(5)
      ..write(obj.createdAt)

      ..writeByte(6)
      ..write(obj.updatedAt);

  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
