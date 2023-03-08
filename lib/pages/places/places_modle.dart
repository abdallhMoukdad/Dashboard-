import 'dart:convert';

import 'dart:io';

import 'dart:typed_data';

import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class DigestAuthSuccess {
  DigestAuthSuccess({
    required this.places,
    required this.placeCount,
  });

  List<Place> places;
  int placeCount;

  factory DigestAuthSuccess.fromJson(Map<String, dynamic> json) =>
      DigestAuthSuccess(
        places: List<Place>.from(json["places"].map((x) => Place.fromJson(x))),
        placeCount: json["placeCount"],
      );

  Map<String, dynamic> toJson() => {
        "places": List<dynamic>.from(places.map((x) => x.toJson())),
        "placeCount": placeCount,
      };
}

List<Place> productFromJson(Map<String, dynamic> json) {
  return List<Place>.from(json["places"]["data"].map((x) => Place.fromJson(x)))
      .toList();
}

List<Place> productFromJsonq(Map<String, dynamic> json) {
  return List<Place>.from(json["places"].map((x) => Place.fromJson(x)))
      .toList();
}

List<Place> productFromJsonw(Map<String, dynamic> json) {
  return List<Place>.from(json["data"].map((x) => Place.fromJson(x))).toList();
}

List<Place> placesFromJson(String str) {
  return List<Place>.from(
    json.decode(str).map((x) {
      return Place.fromJson(x);
    }),
  );
}

List<Place> PlaceFromJsonX(data) {
  return List<Place>.from(
    data.places.map((x) {
      return Place.fromJson(x);
    }),
  );
}

class Place {
  int? id;
  String? name;
  int? country_id;
  String? city;
  int? rating;
  String? description;
  dynamic image;

  Place(
      {this.image,
      this.id,
      this.name,
      this.city,
      this.rating,
      this.description});

  // late String imageName = image.path.split('/').last;
  // late File _image = File(image.path);
  // late Future<Uint8List>? im = _image.readAsBytes();

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        image: json['image'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        rating: json['rating'] as int,
        city: json['city'] as String,
        id: json['id'] as int,
      );

  // Map<String, dynamic> toJson(Places instance) => <String, dynamic>{
  Map<String, dynamic> toJson() => <String, dynamic>{
        //  'image': MultipartFile(this.im, filename: this.imageName),
        'image': MultipartFile(image.path, filename: 'hi'),
        "name": this.name,
        "country_id": '1',
        "city": this.city,
        "rating": this.rating,
        "description": this.description,
      };
}
