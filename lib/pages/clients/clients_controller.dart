import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/pages/clients/clients_model.dart';
import '/pages/clients/clients_service.dart';
import 'package:http/http.dart' as http;

import '../../constants/server_url.dart';
import '../authentication/auth_controller.dart';
class ClientController extends GetxController{
  var isLoading = true.obs;
  // var clientList = <Client>[].obs;
  var clientList = <User>[].obs;


  late ClientService  _clientService;
  AuthController controller = Get.find();

@override
  void onInit() {
   _clientService=Get.put(ClientService());
   fetchC();
    super.onInit();
  }
  Future<void> fetchC() async {
    final response = await http
        .get(Uri.parse(Server.domainNameServer+Server.clients), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer +${controller.token}'
    });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
      // packgesList.value = DigestAuthSuccessp.fromJson(json.decode(response.body)) as List;
      //  packgesList.value = PackgeFromJsonQQP(json.decode(response.body));

      clientList.value = clientFromJson(json.decode(response.body)) ;
      //   packgesList.value = PackgeFromJsonA(json.decode(response.body));

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load client');
    }
  }
/*  void fetchUsers() async {
    try {
      isLoading.value = true;
      var users = await _clientService.fetchUserRequest();
      if (users != null) {
        clientList.value = users;
      }
    } finally {
      isLoading.value = false;
      print(clientList.length);
    }
  }*/


  void deleteUsers() async {
    try {
      isLoading.value = true;
      var response = await _clientService.deleteUserRequest();
      if (response != null) {
        Get.defaultDialog(
            middleText: response.message!,
            textConfirm: 'OK',
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });


      }
    } finally {
      isLoading.value = false;
      // fetchUsers();
    }
  }

  void addUsers(Client data ) async {
    try {
      isLoading.value = true;
      var response = await _clientService.addUserRequest(data);
      if (response != null) {
        Get.defaultDialog(
            middleText: response.message!,
            textConfirm: 'OK',
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            });


      }
    } finally {
      isLoading.value = false;
    //  fetchUsers();
    }
  }



/// Show user a dialog about the error response
  // Get.defaultDialog(
  // middleText: 'User not found!',
  // textConfirm: 'OK',
  // confirmTextColor: Colors.white,
  // onConfirm: () {
  // Get.back();
  // });

}