import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import '../../constants/server_msg.dart';
import '../../constants/server_url.dart';
import 'places_modle.dart';

class PlacseService extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = Product.fromJson();
    httpClient.baseUrl = 'http://192.168.53.105:8000/api/';
    //2.
   // httpClient.defaultContentType = "application/json";
    httpClient.timeout = Duration(seconds: 8);
    httpClient.addResponseModifier((request, response) async {
      print(request.url);
      print(request.method);
      print(response.body);
      print(response.status.code);
    });
    httpClient.addRequestModifier((Request request) async {
      print(request.url);
      print(request.method);
      print(request.decoder);
      print(request.headers);
      return request;
    });
    // var headers = {
    //   'Authorization': "Bearer 9|AFzY8hZhhHRRUM7ahu1MIlg5IZBmup5SOrFrMSMK"
    // };
    // httpClient.addAuthenticator((Request request) async {
    //   request.headers.addAll(headers);
    //   return request;
    // });
  }

  Future<Response<List<Place>?>> getPlacesReqeust() async =>
      await get(Server.getPlaces);

  Future<List<Place>?> fetchPlacseRequest() async {
    final response = await get('user/places',headers: {
      'Authorization': "Bearer 9|AFzY8hZhhHRRUM7ahu1MIlg5IZBmup5SOrFrMSMK"

    });
    print(response.body);

    if (response.statusCode == HttpStatus.ok) {
      return PlaceFromJsonX(response.body);
    } else {
      // return  ServerMsg.fromJson(response.body);
      return null;
    }
  }

  Future<Response> getPlaceReqeust(int id) async =>
      await get(Server.getPlaces + '$id');

  Future<Response> deletePlacesReqeust(int id) async =>
      await get(Server.deletePlaces + '$id');

  // Post request
  Future<ServerMsg?> postPlacesReqeust(Place data) async {
    final response = await post(Server.addPlaces, data.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return ServerMsg.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<Response<Place>> postCases(Place data) async {
    print("---------------------------------------------");
    // print(data.toJson());
    // print(data.im);
    // print(data.imageName);
    print("---------------------------------------------");
    print(data.toJson());

    final form = await post(Server.addPlaces, data.toJson());
    print(form.toString());
    return post(Server.addPlaces, form);
  }

  Future<Response> postCases1(Place data) async {
    // print(data.toJson());

    // final form = await post("http://0.0.0.0:8007/api/admin/place", data.toJson());
    // print(form.toString());
    //   print(form);
    final FormData _formData = FormData({
      'data': data.toJson(),
    });
    print(data.toJson());

    return post("http://0.0.0.0:8007/api/admin/place", _formData, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer 2|5c1uD3tTVatZFJ2XoZ7UdiCm7TQ5X7l0TMt8rUZ0',
    });
  }

  Future<Response<Place>> postCases11(Place data) async {
    final form = FormData({
      'data': data.toJson(),
    });
    return post(Server.addPlaces, form);
  }

  Future<ServerMsg?> postCases2(Place data) async {
    final form = FormData({
      'image': MultipartFile(data.image?.path, filename: 'hi'),
      "name": data.name,
      "country_id": 1,
      "city": data.city,
      "rating": 1,
      "description": data.description,
    });

    final response =
        await post("http://192.168.1.4:8000/api/admin/place", form);
    if (response.statusCode == HttpStatus.ok) {
      print(response.body);
      return ServerMsg.fromJson(response.body);
    } else {
      print(response.statusCode);
      print(response.body);

      return null;
    }
  }

}
