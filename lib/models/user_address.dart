import 'package:app_for_trood/models/user_address_geo.dart';
import 'package:hive/hive.dart';

part "user_address.g.dart";

@HiveType(typeId: 2)
class UserAddress {
  @HiveField(1)
  String? street;
  @HiveField(2)
  String? suite;
  @HiveField(3)
  String? city;
  @HiveField(4)
  String? zipcode;
  @HiveField(5)
  UserAddressGeo? geo;

  UserAddress({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });
  UserAddress.fromJson(Map<String, dynamic> json) {
    street = json['street']?.toString();
    suite = json['suite']?.toString();
    city = json['city']?.toString();
    zipcode = json['zipcode']?.toString();
    geo = (json['geo'] != null) ? UserAddressGeo.fromJson(json['geo']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['suite'] = suite;
    data['city'] = city;
    data['zipcode'] = zipcode;
    if (geo != null) {
      data['geo'] = geo!.toJson();
    }
    return data;
  }
}
