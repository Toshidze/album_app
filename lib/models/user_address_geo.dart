import 'package:hive/hive.dart';

part "user_address_geo.g.dart";

@HiveType(typeId: 4)
class UserAddressGeo {
  @HiveField(1)
  String? lat;
  @HiveField(2)
  String? lng;

  UserAddressGeo({
    this.lat,
    this.lng,
  });
  UserAddressGeo.fromJson(Map<String, dynamic> json) {
    lat = json['lat']?.toString();
    lng = json['lng']?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
