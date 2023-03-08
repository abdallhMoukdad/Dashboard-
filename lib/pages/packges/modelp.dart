List<DigestAuthSuccessp>  PackgeFromJsonQQP(List<dynamic> data) {
  return List<DigestAuthSuccessp>.from(
      data.map((e) {
        print(e);
        print('--------------------------------\n');

        return DigestAuthSuccessp.fromJson(e);
      }).toList()
  );
}

class DigestAuthSuccessp {
  DigestAuthSuccessp({
    required this.package,
  });

  Package package;

  factory DigestAuthSuccessp.fromJson(Map<String, dynamic> json) => DigestAuthSuccessp(
    package: Package.fromJson(json["package"]),
  );

  Map<String, dynamic> toJson() => {
    "package": package.toJson(),
  };
}

class Package {
  Package({
    required  this.id,
    required  this.addedBy,
    required  this.name,
    required  this.price,
    required   this.startDate,
    required this.endDate,
    required  this.duration,
    required  this.noPeople,
    required  this.rating,
    required  this.views,
    required    this.packageImage,
    required   this.description,
    required   this.companyName,
    required   this.transportType,
    required  this.hotelName,
    required  this.places,
    required   this.countryId,
    required this.createdAt,
    required  this.updatedAt,
  });

  int id;
  String addedBy;
  String name;
  int price;
  DateTime startDate;
  DateTime endDate;
  String duration;
  int noPeople;
  double rating;
  int views;
  String packageImage;
  String description;
  String companyName;
  String transportType;
  String hotelName;
  List<Place> places;
  int countryId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    id: json["id"],
    addedBy: json["added_by"],
    name: json["name"],
    price: json["price"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    duration: json["duration"],
    noPeople: json["no_people"],
    rating: json["rating"].toDouble(),
    views: json["views"],
    packageImage: json["package_image"],
    description: json["description"],
    companyName: json["company_name"],
    transportType: json["transport_type"],
    hotelName: json["hotel_name"],
    places: List<Place>.from(json["places"].map((x) => Place.fromJson(x))),
    countryId: json["country_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "added_by": addedBy,
    "name": name,
    "price": price,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "duration": duration,
    "no_people": noPeople,
    "rating": rating,
    "views": views,
    "package_image": packageImage,
    "description": description,
    "company_name": companyName,
    "transport_type": transportType,
    "hotel_name": hotelName,
   "places": List<dynamic>.from(places.map((x) => x.toJson())),
    "country_id": countryId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Place {
  Place({
    required this.id,
    required this.packageId,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int packageId;
  String name;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
    id: json["id"],
    packageId: json["package_id"],
    name: json["name"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "package_id": packageId,
    "name": name,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
