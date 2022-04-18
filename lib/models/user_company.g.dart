// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_company.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserCompanyAdapter extends TypeAdapter<UserCompany> {
  @override
  final int typeId = 3;

  @override
  UserCompany read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCompany(
      name: fields[1] as String?,
      catchPhrase: fields[2] as String?,
      bs: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserCompany obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.catchPhrase)
      ..writeByte(3)
      ..write(obj.bs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCompanyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
