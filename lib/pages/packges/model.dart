List<DigestAuthSuccess> PackgeFromJsonQQQ(Map<String, dynamic> data) {
  return List<DigestAuthSuccess>.from(data.values.map((e) {
    print(e);
    return DigestAuthSuccess.fromJson(e);
  }).toList());
}

List<DigestAuthSuccess> PackgeFromJsonQQ(List<dynamic> data) {
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
    required this.name,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.duration,
    required this.noPeople,
    required this.rating,
    required this.packageImage,
    required this.description,
    required this.companyName,
    required this.transportType,
    required this.hotelName,
    required this.countryId,
    required this.createdAt,
    required this.updatedAt,
  });

  late int id;
  late String addedBy;
  late String name;
  late int price;
  late String startDate;
  late String endDate;
  late String duration;
  late int noPeople;
  late int rating;
  late String packageImage;
  late String description;
  String companyName;
  String transportType;
  String hotelName;

  late int countryId;
  late DateTime createdAt;
  late DateTime updatedAt;

  factory DigestAuthSuccess.fromJson(Map<String, dynamic> json) =>
      DigestAuthSuccess(
        id: json["id"],
        addedBy: json["added_by"],
        name: json["name"],
        price: json["price"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        duration: json["duration"],
        noPeople: json["no_people"],
        rating: json["rating"],
        packageImage: json["package_image"],
        companyName: json["company_name"],
        transportType: json["transport_type"],
        hotelName: json["hotel_name"],
        description: json["description"],
        countryId: json["country_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "added_by": addedBy,
        "name": name,
        "price": price,
        //  "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        // "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "duration": duration,
        "no_people": noPeople,
        "rating": rating,
        "package_image": packageImage,
        "description": description,
        "country_id": countryId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
