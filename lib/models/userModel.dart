class User {
  int? id;
  String? name;
  String? username;
  String? email;
  UserAddress? address;
  String? phone;
  String? website;
  UserCompany? company;
  int? albums;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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

class UserCompany {
  String? name;
  String? catchPhrase;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['catchPhrase'] = catchPhrase;
    data['bs'] = bs;
    return data;
  }
}

class UserAddressGeo {
  String? lat;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class UserAddress {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
