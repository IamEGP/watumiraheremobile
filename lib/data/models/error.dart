// To parse this JSON data, do
//
//     final error = errorFromJson(jsonString);

import 'dart:convert';

List<Error> errorFromJson(String str) => List<Error>.from(json.decode(str).map((x) => Error.fromJson(x)));

String errorToJson(List<Error> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Error {
  Error({
    this.field,
    this.message,
  });

  String field;
  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        field: json["field"] == null ? null : json["field"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "field": field == null ? null : field,
        "message": message == null ? null : message,
      };
}
