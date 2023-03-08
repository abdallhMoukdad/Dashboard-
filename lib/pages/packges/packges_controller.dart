import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants/server_msg.dart';
import '/pages/packges/packges_service.dart';
import '/pages/places/places_modle.dart';
import '/pages/places/places_service.dart';
import 'package:http/http.dart'as  http;
import '../../constants/server_url.dart';
import '../authentication/auth_controller.dart';
import 'model.dart';
import 'packge_model.dart';
import 'modelp.dart';
class PackgesController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _packgesService = Get.put(PackgesService());
    fetchB();
  }
  AuthController controller = Get.find();

  late final PackgesService _packgesService;
  var isLoading = true.obs;
  var pimage;
  var packgesList = [].obs;

  Future<void> getPackges() async {
    final response = await _packgesService.getPackgesReqeust();
    if (response.isOk) {}
  }

  Future<void> fetchB() async {
    final response = await http
        .get(Uri.parse(Server.domainNameServer+Server.getPackges), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer +${controller.token}'
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
     // packgesList.value = DigestAuthSuccessp.fromJson(json.decode(response.body)) as List;
      //  packgesList.value = PackgeFromJsonQQP(json.decode(response.body));

      packgesList.value = PackgeFromJsonQQ(json.decode(response.body));
   //   packgesList.value = PackgeFromJsonA(json.decode(response.body));

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load packge');
    }
  }
  Future<void> fetchPackges() async {
    try {
      isLoading.value = true;

      final response = await _packgesService.fetchPackgesRequest();
      if (response != null) {
        packgesList.value = response;
      } else {
        /// Show user a dialog about the error response
        Get.defaultDialog(
            middleText: 'Placse not found!',
            textConfirm: 'OK',
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<ServerMsg?> postPackges({required Packge packge}) async {

    final response =await _packgesService.postCases2(packge);
    if (response.statusCode == HttpStatus.ok) {
      return ServerMsg.fromJson(response.body);
    } else {
      return null;
    }
  }

/* Future<void> postPackges({dynamic image}) async {
  /*  String imageName = image.path.split('/').last;
    Future<Uint8List>? im;
    File? _image;

    _image = File(image.path);
    im = _image.readAsBytes();*/
    final response = _packgesService.postCases(
      Packge()
      /*Places(
      image: MultipartFile(im, filename: imageName),
    )*/

    );
  }*/
}
