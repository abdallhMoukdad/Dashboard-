// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import 'secure_storage.dart';
// import 'server_config.dart';
// import 'user.dart';
// import 'user_info.dart';
//
// // import 'package:flutter_easyloading/flutter_easyloading.dart';
// class loginService {
//   var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.login);
//   var message;
//   var token;
//   bool checkBox = true;
//
//   Future<bool> login(User user) async {
//     var response = await http.post(
//       url,
//       headers: {'Accept': 'application/json'},
//       body: {
//         'email': user.email,
//         'password': user.password,
//       },
//     );
//     print(response.statusCode);
//     print(response.body);
//
//     if (response.statusCode == 200) {
//       var jsonResponse = jsonDecode(response.body);
//       message = jsonResponse['msg'];
//       token = jsonResponse['token'];
//       Userinformation.USER_TOKEN = token;
//       if (checkBox) {
// //save token to device
//         Securestorage storage = Securestorage();
//         await storage.save(token, Userinformation.USER_TOKEN);
//       }
//       return true;
//     } else if (response.statusCode == 401) {
//       var jsonResponse = jsonDecode(response.body);
//       message = jsonResponse['error'];
//       return false;
//     } else if (response.statusCode == 422) {
//       var jsonResponse = jsonDecode(response.body);
//       message = jsonResponse['errors'];
//       return false;
//     } else {
//       message = 'server error';
//       return false;
//     }
//   }
// }
