// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Packge _$PackgeFromJson(Map<String, dynamic> json) => Packge(
     // json['name'] as String,
      (json['price'] as num).toDouble(),
      json['duration'] as int,
      json['no_people'] as int,
      // json['hotelName'] as String,
      // json['transportName'] as String,
      // json['transportType'] as String,
      image: json['image'] as String?,
  //    imageData: json['imageData'],
      places: (json['places'] as List<dynamic>?)
          ?.map((e) => Place.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PackgeToJson(Packge instance) => <String, dynamic>{
      'packgeName': instance.packgeName,
      'packgePrice': instance.packgePrice,
      'day': instance.day,
    //  'image': instance.image,
    //   'imageData':MultipartFile(instance.im, filename: instance.imageName),
      'people': instance.people,
      // 'hotelName': instance.hotelName,
      // 'transportName': instance.transportName,
      // 'transportType': instance.transportType,
      'places': instance.places.map((e) => e.toJson()).toList(),
    };
