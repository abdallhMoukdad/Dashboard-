import 'package:http/http.dart' as http;

import 'post.dart';
class RemoteServices {
  static var client = http.Client();
  /* String productsApi =
      'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';*/
  static Future<List<Post>?> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return PostFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
