import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import '/pages/places/places_modle.dart';
import 'package:json_annotation/json_annotation.dart';
part 'packge_model.g.dart';


List<Packge>  PackgeFromJson(Map<String, dynamic>  data) {
 return List<Packge>.from(
  data.values.map((e) => Packge.fromJson(e)).toList()
 );
}
List<Packge>  PackgeFromJsonA(Map<String, dynamic>  data) {
 return List<Packge>.from(
     data.values.toList().map((e) =>Packge.fromJson(e) ).toList()
 );
}

List<Packge> PackgeFromJsonX(var json) {
 return List<Packge>.from(json.map((x) => Packge.fromJson(x))).toList();
}

@JsonSerializable()
class Packge {
  String? packgeName;
 late double packgePrice;
 late int day;
 String? image;
 dynamic imageData;
 late int people;
 // late String hotelName;
 // late String transportName;
 // late String transportType;
 List<Place> places;

 // late String imageName = imageData.path.split('/').last;
 // late File _image = File(imageData.path);
 // late Future<Uint8List>? im = _image.readAsBytes();



 Packge(/*this.packgeName*/this.packgePrice,this.day,this.people,
    // this.hotelName,this.transportName,this.transportType,
     {this.image,this.imageData,List<Place>? places}): places = places ?? <Place>[];

 factory Packge.fromJson(Map<String, dynamic> json) => _$PackgeFromJson(json);

 Map<String, dynamic> toJson() => _$PackgeToJson(this);

}