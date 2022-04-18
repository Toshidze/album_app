// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_geo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAddressGeoAdapter extends TypeAdapter<UserAddressGeo> {
  @override
  final int typeId = 4;

  @override
  UserAddressGeo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserAddressGeo(
      lat: fields[1] as String?,
      lng: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserAddressGeo obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.lat)
      ..writeByte(2)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAddressGeoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
