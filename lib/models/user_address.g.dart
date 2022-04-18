// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAddressAdapter extends TypeAdapter<UserAddress> {
  @override
  final int typeId = 2;

  @override
  UserAddress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserAddress(
      street: fields[1] as String?,
      suite: fields[2] as String?,
      city: fields[3] as String?,
      zipcode: fields[4] as String?,
      geo: fields[5] as UserAddressGeo?,
    );
  }

  @override
  void write(BinaryWriter writer, UserAddress obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.street)
      ..writeByte(2)
      ..write(obj.suite)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.zipcode)
      ..writeByte(5)
      ..write(obj.geo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
