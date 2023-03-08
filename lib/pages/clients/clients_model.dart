List<Client>  ClientFromJson(List<dynamic>data) {
  return List<Client>.from(
    data.map((x) {
      return Client.fromJson(x);
    }),
  );
}

class Client {
  int? id;
  String? name;
  String? email;
  int? packageId;
  bool ?paid;

  static List<Client>? fromJson(x) {}

  Map<String, dynamic>? toJson(){}
}


class DigestAuthSuccess {
  DigestAuthSuccess({
    required this.users,
  });

  List<User> users;

  factory DigestAuthSuccess.fromJson(Map<String, dynamic> json) => DigestAuthSuccess(
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))).toList(),
  );

  Map<String, dynamic> toJson() => {
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
  };
}
List<User> clientFromJson(Map<String, dynamic> json) {
  return List<User>.from(json["users"].map((x) => User.fromJson(x)))
      .toList();
}

class User {
  User({
    required   this.id,
    required this.name,
    required   this.email,
    required this.password,
    required  this.mobile,
    required  this.cardNumber,
    required   this.registeredAt,
    required  this.emailVerifiedAt,
    required   this.roleId,
    required   this.rememberToken,
    required   this.createdAt,
    required    this.updatedAt,
  });

  int id;
  String name;
  String email;
  String password;
  String mobile;
  String cardNumber;
  DateTime registeredAt;
  dynamic emailVerifiedAt;
  int roleId;
  dynamic rememberToken;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    mobile: json["Mobile"],
    cardNumber: json["card_number"],
    registeredAt: DateTime.parse(json["registeredAt"]),
    emailVerifiedAt: json["email_verified_at"],
    roleId: json["role_id"],
    rememberToken: json["remember_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "Mobile": mobile,
    "card_number": cardNumber,
    "registeredAt": registeredAt.toIso8601String(),
    "email_verified_at": emailVerifiedAt,
    "role_id": roleId,
    "remember_token": rememberToken,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
