// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

RegistrationModel registrationModelFromJson(String str) => RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) => json.encode(data.toJson());

class RegistrationModel {
    User user;
    String token;

    RegistrationModel({
        required this.user,
        required this.token,
    });

    factory RegistrationModel.fromJson(Map<String, dynamic> json) => RegistrationModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
    };
}

class User {
    String name;
    String email;
    DateTime updatedAt;
    DateTime createdAt;
    int userId;

    User({
        required this.name,
        required this.email,
        required this.updatedAt,
        required this.createdAt,
        required this.userId,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "user_id": userId,
    };
}
