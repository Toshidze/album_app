import 'package:hive/hive.dart';

part "user_company.g.dart";

@HiveType(typeId: 3)
class UserCompany {
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? catchPhrase;
  @HiveField(3)
  String? bs;

  UserCompany({
    this.name,
    this.catchPhrase,
    this.bs,
  });
  UserCompany.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    catchPhrase = json['catchPhrase']?.toString();
    bs = json['bs']?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['catchPhrase'] = catchPhrase;
    data['bs'] = bs;
    return data;
  }
}
