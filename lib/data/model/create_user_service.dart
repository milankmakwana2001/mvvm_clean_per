// To parse this JSON data, do
//
//     final createUserService = createUserServiceFromJson(jsonString);

import 'dart:convert';

import 'package:mvvm_clean_per/domain/models/create_user_model.dart';

CreateUserService createUserServiceFromJson(String str) =>
    CreateUserService.fromJson(json.decode(str));

String createUserServiceToJson(CreateUserService data) =>
    json.encode(data.toJson());

class CreateUserService extends CreateUserModel {
  CreateUserService({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  }) : super(
          name: name,
          job: job,
        );

  final String name;
  final String job;
  final String id;
  final DateTime createdAt;

  factory CreateUserService.fromJson(Map<String, dynamic> json) =>
      CreateUserService(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
      };
}
