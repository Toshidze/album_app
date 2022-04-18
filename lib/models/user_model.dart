import 'package:app_for_trood/models/user_address.dart';
import 'package:app_for_trood/models/user_company.dart';
import 'package:hive/hive.dart';

part "user_model.g.dart";

@HiveType(typeId: 1)
class User {
  @HiveField(4)
  int? id;
  @HiveField(5)
  String? name;
  @HiveField(6)
  String? username;
  @HiveField(7)
  String? email;
  @HiveField(8)
  UserAddress? address;
  @HiveField(9)
  String? phone;
  @HiveField(10)
  String? website;
  @HiveField(11)
  UserCompany? company;
  @HiveField(12)
  int? albums;
  @HiveField(13)
  int? posts;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
    this.albums,
    this.posts,
  });

  User.fromJson(Map<String, dynamic> json, Map<int, int> mapAlbums,
      Map<int, int> mapPosts) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    username = json['username']?.toString();
    email = json['email']?.toString();
    address = (json['address'] != null)
        ? UserAddress.fromJson(json['address'])
        : null;
    phone = json['phone']?.toString();
    website = json['website']?.toString();
    company = (json['company'] != null)
        ? UserCompany.fromJson(json['company'])
        : null;

    albums = mapAlbums[id] ?? 0;
    posts = mapPosts[id] ?? 0;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['phone'] = phone;
    data['website'] = website;
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}
