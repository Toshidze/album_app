class UserCompany {
/*
{
  "name": "Romaguera-Crona",
  "catchPhrase": "Multi-layered client-server neural-net",
  "bs": "harness real-time e-markets"
} 
*/

  String? name;
  String? catchPhrase;
  String? bs;

  UserCompany({
    this.name,
    this.catchPhrase,
    this.bs,
  });
  UserCompany.fromJson(Map<String, dynamic> json) {
    name = json["name"]?.toString();
    catchPhrase = json["catchPhrase"]?.toString();
    bs = json["bs"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = name;
    data["catchPhrase"] = catchPhrase;
    data["bs"] = bs;
    return data;
  }
}

class UserAddressGeo {
/*
{
  "lat": "-37.3159",
  "lng": "81.1496"
} 
*/

  String? lat;
  String? lng;

  UserAddressGeo({
    this.lat,
    this.lng,
  });
  UserAddressGeo.fromJson(Map<String, dynamic> json) {
    lat = json["lat"]?.toString();
    lng = json["lng"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["lat"] = lat;
    data["lng"] = lng;
    return data;
  }
}

class UserAddress {
/*
{
  "street": "Kulas Light",
  "suite": "Apt. 556",
  "city": "Gwenborough",
  "zipcode": "92998-3874",
  "geo": {
    "lat": "-37.3159",
    "lng": "81.1496"
  }
} 
*/

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
    street = json["street"]?.toString();
    suite = json["suite"]?.toString();
    city = json["city"]?.toString();
    zipcode = json["zipcode"]?.toString();
    geo = (json["geo"] != null) ? UserAddressGeo.fromJson(json["geo"]) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["street"] = street;
    data["suite"] = suite;
    data["city"] = city;
    data["zipcode"] = zipcode;
    if (geo != null) {
      data["geo"] = geo!.toJson();
    }
    return data;
  }
}

class User {
/*
{
  "id": 1,
  "name": "Leanne Graham",
  "username": "Bret",
  "email": "Sincere@april.biz",
  "address": {
    "street": "Kulas Light",
    "suite": "Apt. 556",
    "city": "Gwenborough",
    "zipcode": "92998-3874",
    "geo": {
      "lat": "-37.3159",
      "lng": "81.1496"
    }
  },
  "phone": "1-770-736-8031 x56442",
  "website": "hildegard.org",
  "company": {
    "name": "Romaguera-Crona",
    "catchPhrase": "Multi-layered client-server neural-net",
    "bs": "harness real-time e-markets"
  }
} 
*/

  int? id;
  String? name;
  String? username;
  String? email;
  UserAddress? address;
  String? phone;
  String? website;
  UserCompany? company;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });
  User.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    name = json["name"]?.toString();
    username = json["username"]?.toString();
    email = json["email"]?.toString();
    address = (json["address"] != null)
        ? UserAddress.fromJson(json["address"])
        : null;
    phone = json["phone"]?.toString();
    website = json["website"]?.toString();
    company = (json["company"] != null)
        ? UserCompany.fromJson(json["company"])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["name"] = name;
    data["username"] = username;
    data["email"] = email;
    if (address != null) {
      data["address"] = address!.toJson();
    }
    data["phone"] = phone;
    data["website"] = website;
    if (company != null) {
      data["company"] = company!.toJson();
    }
    return data;
  }
}
