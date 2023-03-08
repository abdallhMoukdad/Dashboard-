import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import '/pages/users/post.dart';

class Service extends GetConnect{
  Future<Response> getUser()async =>await get('https://jsonplaceholder.typicode.com/posts');
  Future<List<Post>?> fetchUser( ) async {
    final response = await get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == HttpStatus.ok) {
      print(response.body);
      //json.decode(response.body);
      var x=response.body;
      for (var e in x){
        print(e);
      }
  //   print(response.body);
    return  PostFromJson1(response.body);
    } else {
      return null;
    }
  }


  // Future<List<Post>> fetchUser1( ) async {
  //   final response = await get('https://jsonplaceholder.typicode.com/posts');
  //
  //
  //     print(response.body);
  //     //json.decode(response.body);
  //     var x=response.body;
  //     for (var e in x){
  //       print(e);
  //     }
  //     //   print(response.body);
  //     PostFromJson1(response.body);
  //
  // }
}
