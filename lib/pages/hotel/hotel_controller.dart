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
import 'model.dart';

class HotelController extends GetxController {
  @override
  AuthController controller = Get.find();

  void onInit() {
    super.onInit();
    fetchHotel();
    //  fun();
  }

  var isLoading = true.obs;

  var hotelList = [].obs;


  Future<void> fetchHotel() async {
    final response = await http
        .get(Uri.parse(Server.domainNameServer+'/hotel'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer +${controller.token}'
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
      //  placseList.value = productFromJson(json.decode(response.body));

      hotelList.value = HotelFromJson(json.decode(response.body));

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

      throw Exception('Failed to load hotels');
    }
  }







}
