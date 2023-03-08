import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/pages/places/places_modle.dart';
import '/pages/places/places_service.dart';
import 'package:http/http.dart' as http;

import '../../constants/server_url.dart';
import '../authentication/auth_controller.dart';

class PlacseController extends GetxController {
  @override
  AuthController controller = Get.find();

  void onInit() {
    super.onInit();
    _placseService = Get.put(PlacseService());
     // fetchPlacses();
    fetchPlaces();
  //  fun();
  }

  late final PlacseService _placseService;
  var isLoading = true.obs;

  var placseList = [].obs;

  Future<void> getPlacse() async {
    final response = await _placseService.getPlacesReqeust();
    if (response.isOk) {}
  }

  Future<void> fetchPlaces() async {
    final response = await http
        .get(Uri.parse(Server.domainNameServer+Server.getPlaces), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer +${controller.token}'
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
    //  placseList.value = productFromJson(json.decode(response.body));

      placseList.value = productFromJsonq(json.decode(response.body));

    } else {
    /// Show user a dialog about the error response
    // Get.defaultDialog(
    // middleText: 'Placse not found!',
    // textConfirm: 'OK',
    // confirmTextColor: Colors.white,
    // onConfirm: () {
    // fetchPlacses();
    // Get.back();
    // });

      throw Exception('Failed to load places');
    }
  }

  fun() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer 8|wE8eMwCt9K58scBTC54kDiqtVaDcWBDMBn0nWYiM'
    };
    var request = http.Request(
        'GET', Uri.parse('http://192.168.53.105:8000/api/user/places'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final res = await response.stream.bytesToString();
      print(res);
      placseList.value =
          productFromJson(json.decode(await response.stream.bytesToString()));
      print(placseList.value.length);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> fetchPlacses() async {
    try {
      isLoading.value = true;

      final response = await _placseService.fetchPlacseRequest();
      if (response != null) {
        placseList.value = response;
      } else {
        /// Show user a dialog about the error response
        Get.defaultDialog(
            middleText: 'Placse not found!',
            textConfirm: 'OK',
            confirmTextColor: Colors.white,
            onConfirm: () {
              fetchPlacses();
              Get.back();
            });
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> postPlacse9999({dynamic image}) async {
    String imageName = image.path.split('/').last;
    Future<Uint8List>? im;
    File? _image;

    _image = File(image.path);
    im = _image.readAsBytes();
    print(_image);
    print(im);

    final response = _placseService.postCases(Place(image: image));
    // print(response);
  }

  Future<void> postPlacse({dynamic image}) async {
    String imageName = image.path.split('/').last;
    Future<Uint8List>? im;
    File? _image;

    _image = File(image.path);
    im = _image.readAsBytes();
    final response = _placseService.postCases(Place(
      image: MultipartFile(im, filename: imageName),
    ));
  }

  Future<void> postPlacse1({
    required String name,
    required String city,
    required String description,
    required int rating,
    required dynamic image,
  }) async {
    final data = Place(
      name: name,
      city: city,
      description: description,
      rating: rating,
      image: image,
    );
    final response = await _placseService.postCases2(data);
    //  print(response);
  }
}
