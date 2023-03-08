class ServerMsg{
 late bool ?status;
  String? errorNumber;
  String? message;

  ServerMsg.fromJson(Map <String ,dynamic> json){
   // status = json['status'];
  //  errorNumber = json['errNum'];
    message = json['message'];
  }
}