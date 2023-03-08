import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import '/constants/server_msg.dart';
import '/pages/clients/clients_model.dart';
import '/widgets/large_screen.dart';

class ClientService extends GetConnect {
  //post
  Future<ServerMsg?> addUserRequest(Client data) async {
    final response = await post('https://jsonplaceholder.typicode.com/posts',data.toJson);

    if (response.statusCode == HttpStatus.ok) {
      return ServerMsg.fromJson(response.body);
    } else {
      return null;
    }
  }
  //delete
  Future<ServerMsg?> deleteUserRequest() async {
    final response = await delete('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == HttpStatus.ok) {
      return ServerMsg.fromJson(response.body);
    } else {
      return null;
    }
  }
  //put

  //get
  Future<List<Client>?> fetchUserRequest() async {
    final response = await get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == HttpStatus.ok) {
      return ClientFromJson(response.body);
    } else {
      return null;
    }
  }

//block

//did he paid

//search
}
