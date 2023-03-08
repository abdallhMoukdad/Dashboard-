import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import '/pages/packges/packge_model.dart';
import '../../constants/server_msg.dart';
import '../../constants/server_url.dart';

class PackgesService extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = Product.fromJson();
    httpClient.baseUrl = 'http://192.168.206.105:8001/api/';
    //2.
    httpClient.defaultContentType = "application/json";
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
    var headers = {
      'Authorization': "Bearer 8|wE8eMwCt9K58scBTC54kDiqtVaDcWBDMBn0nWYiM"
    };
    httpClient.addAuthenticator((Request request) async {
      request.headers.addAll(headers);
      return request;
    });

  }

  Future<Response<List<Packge>?>> getPackgesReqeust() async =>
      await get(Server.getPlaces);

  Future<List<Packge>?> fetchPackgesRequest() async {
    final response =
        await get('http://192.168.1.4:8000/api/admin/package', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer 6|GD3VzGzRJxmEQyApN0iYtwgmregUJDiTNZzOrITT'
    });

    if (response.statusCode == HttpStatus.ok) {
      return PackgeFromJson(response.body);
    } else {
      // return  ServerMsg.fromJson(response.body);
      return null;
    }
  }

  Future<Response> getPackgeReqeust(int id) async =>
      await get(Server.getPlaces + '$id');

  Future<Response> deletePackgeReqeust(int id) async =>
      await get(Server.deletePlaces + '$id');

  // Post request
  Future<ServerMsg?> postPackgeReqeust(Packge data) async {
    final response = await post(Server.addPlaces, data.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return ServerMsg.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<Response<Packge>> postCases(Packge data) async {
    final form = await post(Server.addPlaces, data.toJson());
    return post(Server.addPlaces, form);
  }

  Future<Response<Packge>> postCases1(Packge data) async {
    final form = FormData({
      'Packges': data.toJson(),
    });

    return post(Server.addPlaces, form);
  }

  Future<Response> postCases2(Packge data) async {
    final form = FormData({
      'Packges': data.toJson(),
    });
    print(form);

    return post(Server.addPlaces, form);
  }
}
