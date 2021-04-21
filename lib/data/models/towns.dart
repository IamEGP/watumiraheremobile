// To parse this JSON data, do
//
//     final towns = townsFromJson(jsonString);

import 'dart:convert';

Towns townsFromJson(String str) => Towns.fromJson(json.decode(str));

String townsToJson(Towns data) => json.encode(data.toJson());

class Towns {
  Towns({
    this.docs,
    this.totalDocs,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  List<Town> docs;
  int totalDocs;
  int limit;
  int totalPages;
  int page;
  int pagingCounter;
  bool hasPrevPage;
  bool hasNextPage;
  dynamic prevPage;
  int nextPage;

  factory Towns.fromJson(Map<String, dynamic> json) => Towns(
        docs: json["docs"] == null ? null : List<Town>.from(json["docs"].map((x) => Town.fromJson(x))),
        totalDocs: json["totalDocs"] == null ? null : json["totalDocs"],
        limit: json["limit"] == null ? null : json["limit"],
        totalPages: json["totalPages"] == null ? null : json["totalPages"],
        page: json["page"] == null ? null : json["page"],
        pagingCounter: json["pagingCounter"] == null ? null : json["pagingCounter"],
        hasPrevPage: json["hasPrevPage"] == null ? null : json["hasPrevPage"],
        hasNextPage: json["hasNextPage"] == null ? null : json["hasNextPage"],
        prevPage: json["prevPage"],
        nextPage: json["nextPage"] == null ? null : json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "docs": docs == null ? null : List<dynamic>.from(docs.map((x) => x.toJson())),
        "totalDocs": totalDocs == null ? null : totalDocs,
        "limit": limit == null ? null : limit,
        "totalPages": totalPages == null ? null : totalPages,
        "page": page == null ? null : page,
        "pagingCounter": pagingCounter == null ? null : pagingCounter,
        "hasPrevPage": hasPrevPage == null ? null : hasPrevPage,
        "hasNextPage": hasNextPage == null ? null : hasNextPage,
        "prevPage": prevPage,
        "nextPage": nextPage == null ? null : nextPage,
      };
}

class Town {
  Town({
    this.id,
    this.name,
    this.slug,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.collectionPoints,
  });

  String id;
  String name;
  String slug;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<CollectionPoint> collectionPoints;

  factory Town.fromJson(Map<String, dynamic> json) => Town(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        collectionPoints: json["collectionPoints"] == null ? null : List<CollectionPoint>.from(json["collectionPoints"].map((x) => CollectionPoint.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "createdBy": createdBy == null ? null : createdBy,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "collectionPoints": collectionPoints == null ? null : List<dynamic>.from(collectionPoints.map((x) => x.toJson())),
      };
}

class CollectionPoint {
  CollectionPoint({
    this.days,
    this.id,
    this.town,
    this.name,
    this.slug,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  int days;
  String id;
  String town;
  String name;
  String slug;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory CollectionPoint.fromJson(Map<String, dynamic> json) => CollectionPoint(
        days: json["days"] == null ? null : json["days"],
        id: json["_id"] == null ? null : json["_id"],
        town: json["town"] == null ? null : json["town"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "days": days == null ? null : days,
        "_id": id == null ? null : id,
        "town": town == null ? null : town,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "createdBy": createdBy == null ? null : createdBy,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
