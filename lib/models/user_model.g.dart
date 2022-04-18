// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[4] as int?,
      name: fields[5] as String?,
      username: fields[6] as String?,
      email: fields[7] as String?,
      address: fields[8] as UserAddress?,
      phone: fields[9] as String?,
      website: fields[10] as String?,
      company: fields[11] as UserCompany?,
      albums: fields[12] as int?,
      posts: fields[13] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(10)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.username)
      ..writeByte(7)
      ..write(obj.email)
      ..writeByte(8)
      ..write(obj.address)
      ..writeByte(9)
      ..write(obj.phone)
      ..writeByte(10)
      ..write(obj.website)
      ..writeByte(11)
      ..write(obj.company)
      ..writeByte(12)
      ..write(obj.albums)
      ..writeByte(13)
      ..write(obj.posts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
