// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.displayImage,
    this.isVerified,
    this.id,
    this.firstName,
    this.lastName,
    this.identifier,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.refreshToken,
  });

  DisplayImage displayImage;
  bool isVerified;
  String id;
  String firstName;
  String lastName;
  String identifier;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String refreshToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
        displayImage: json['displayImage'] == null ? null : DisplayImage.fromJson(json['displayImage']),
        isVerified: json['isVerified'] == null ? null : json['isVerified'],
        id: json['_id'] == null ? null : json['_id'],
        firstName: json['firstName'] == null ? null : json['firstName'],
        lastName: json['lastName'] == null ? null : json['lastName'],
        identifier: json['identifier'] == null ? null : json['identifier'],
        createdAt: json['createdAt'] == null ? null : DateTime.parse(json['createdAt']),
        updatedAt: json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt']),
        v: json['__v'] == null ? null : json['__v'],
        refreshToken: json['refreshToken'] == null ? null : json['refreshToken'],
      );

  Map<String, dynamic> toJson() => {
        'displayImage': displayImage == null ? null : displayImage.toJson(),
        'isVerified': isVerified == null ? null : isVerified,
        '_id': id == null ? null : id,
        'firstName': firstName == null ? null : firstName,
        'lastName': lastName == null ? null : lastName,
        'identifier': identifier == null ? null : identifier,
        'createdAt': createdAt == null ? null : createdAt.toIso8601String(),
        'updatedAt': updatedAt == null ? null : updatedAt.toIso8601String(),
        '__v': v == null ? null : v,
        'refreshToken': refreshToken == null ? null : refreshToken,
      };
}

class DisplayImage {
  DisplayImage({
    this.original,
    this.thumbnail,
  });

  String original;
  String thumbnail;

  factory DisplayImage.fromJson(Map<String, dynamic> json) => DisplayImage(
        original: json['original'] == null ? null : json['original'],
        thumbnail: json['thumbnail'] == null ? null : json['thumbnail'],
      );

  Map<String, dynamic> toJson() => {
        'original': original == null ? null : original,
        'thumbnail': thumbnail == null ? null : thumbnail,
      };
}
