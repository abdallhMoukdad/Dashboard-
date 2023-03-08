List<DigestAuthSuccess> HotelFromJson(List<dynamic> data) {
  return List<DigestAuthSuccess>.from(data.map((e) {
    print(e);
    print('--------------------------------\n');

    return DigestAuthSuccess.fromJson(e);
  }).toList());
}

class DigestAuthSuccess {
  DigestAuthSuccess({
    required this.id,
    required this.addedBy,
    required this.hName,
    required  this.city,
    required  this.rate,
    required  this.views,
    required  this.image,
    required  this.countryId,
    required this.description,
    required  this.createdAt,
    required this.updatedAt,
  });

  int id;
  String addedBy;
  String hName;
  String city;
  int rate;
  int views;
  String image;
  int countryId;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory DigestAuthSuccess.fromJson(Map<String, dynamic> json) => DigestAuthSuccess(
    id: json["id"],
    addedBy: json["added_By"],
    hName: json["h_name"],
    city: json["city"],
    rate: json["rate"],
    views: json["views"],
    image: json["image"],
    countryId: json["country_id"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "added_By": addedBy,
    "h_name": hName,
    "city": city,
    "rate": rate,
    "views": views,
    "image": image,
    "country_id": countryId,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
