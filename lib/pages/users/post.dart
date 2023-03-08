import 'dart:convert';

List<Post> PostFromJson(String str) {
  return List<Post>.from(
    json.decode(str).map((x) {
      return Post.fromJson(x);
    }),
  );
}
List<Post>  PostFromJson1(List<dynamic>data) {
  return List<Post>.from(
    data.map((x) {
      return Post.fromJson(x);
    }),
  );
}

class Post {
  int? id;
  int ?userId;
  String ?title;
  String ?body;
  Post({this.id,this.userId,this.title,this.body});


  factory Post.fromJson (Map<String, dynamic> json) => Post(

    id: json['id'] as int,
    userId:json['userId'] as int ,
    title:json['title'] as String,
    body:json['body']as String,
  );



  Map<String, dynamic> toJson() => <String, dynamic>{
    'id':this.id,
    'userId':this.userId,
    'title':this.title,
    'body':this.body,

  };
}