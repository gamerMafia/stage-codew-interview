// To parse this JSON data, do
//
//     final todoResponse = todoResponseFromJson(jsonString);

import 'dart:convert';

class TodoResponse {
  TodoResponse({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  factory TodoResponse.fromRawJson(String str) => TodoResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TodoResponse.fromJson(Map<String, dynamic> json) => TodoResponse(
    userId: json["userId"] == null ? null : json["userId"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    completed: json["completed"] == null ? null : json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "completed": completed == null ? null : completed,
  };
}
