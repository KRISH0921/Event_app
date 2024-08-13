
import 'dart:convert';

FavoriteEvent welcomeFromMap(String str) => FavoriteEvent.fromMap(json.decode(str));

class FavoriteEvent {
  String? status;
  int? code;
  String? message;

  FavoriteEvent({
    this.status,
    this.code,
    this.message,
  });

  factory FavoriteEvent.fromMap(Map<String, dynamic> json) => FavoriteEvent(
    status: json["status"],
    code: json["code"],
    message: json["message"],
  );

}
