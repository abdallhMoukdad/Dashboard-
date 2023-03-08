import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants/server_msg.dart';
import '/pages/overview/overview.dart';
import '/pages/packges/packges_service.dart';
import '/pages/places/places_service.dart';
import 'package:http/http.dart'as  http;
import '../../../constants/server_url.dart';
import '../../authentication/auth_controller.dart';
import 'overview_modle.dart';
class OverViewController extends GetxController {

  @override
  void onInit() {
    super.onInit();
  //  _packgesService = Get.put(PackgesService());
    fetchO();
  }
  AuthController controller = Get.find();

 // late final PackgesService _packgesService;
  var isLoading = true.obs;
  var pimage;
  var overeViewList = [].obs;
  Rx<DigestAuthSuccess>? data;
//   var data=DigestAuthSuccess(year: '2', numberOfPackages: 4,day: '3434', week: '3233', numberOfPackagesFinished: '333', numberOfPackagesOpened: '3333', month: '333',).obs;


  Future<void> fetchO() async {
    final response = await http
        .get(Uri.parse(Server.domainNameServer+'/package/overview'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer +${controller.token}'
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
      // packgesList.value = DigestAuthSuccessp.fromJson(json.decode(response.body)) as List;
      //  packgesList.value = PackgeFromJsonQQP(json.decode(response.body));
      data!.value=  DigestAuthSuccess.fromJson(json.decode(response.body))    ;

      // data=  DigestAuthSuccess.fromJson(json.decode(response.body)) as Rx<DigestAuthSuccess>  ;
      print("-------------------------------");

     print(data?.value.numberOfPackages);
     print(data?.value.day);


      //  overeViewList.value=   DigestAuthSuccess.fromJson(json.decode(response.body)) as List  ;
    //  overeViewList.value = PackgeFromJsonQQ(json.decode(response.body));
      //   packgesList.value = PackgeFromJsonA(json.decode(response.body));

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load OverView Data');
    }
  }



}
