import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
import '/pages/authentication/authentication.dart';

import '../login/server_config.dart';
import '../login/user.dart';
import '../login/user_info.dart';

class AuthController extends GetxController {

  var url = Uri.parse('http://192.168.205.105:8000/api/login');
  var email;
  var password;

  var message;
  var token;
  bool checkBox = true;

//  AuthController(AuthenticationPage authenticationPage );

 // AuthController(AuthenticationPage authenticationPage);
  // User user = User(
  //   email: email,
  //   password: password,
  // );
  Future<bool> login(String email,String password) async {
  var response = await http.post(
  url,
  headers: {'Accept': 'application/json'},
  body: {
  'email': email,
  'password':password,
  },
  );
  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200) {
  var jsonResponse = jsonDecode(response.body);
  message = jsonResponse['msg'];
  token = jsonResponse['token'];
  print(token);
  Userinformation.USER_TOKEN = token;
  return true;
  } else if (response.statusCode == 401) {
  var jsonResponse = jsonDecode(response.body);
  message = jsonResponse['error'];
  return false;
  } else if (response.statusCode == 422) {
  var jsonResponse = jsonDecode(response.body);
  message = jsonResponse['errors'];
  return false;
  } else {
  message = 'server error';
  return false;
  }
  }
  }


