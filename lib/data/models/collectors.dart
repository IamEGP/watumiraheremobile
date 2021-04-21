// To parse this JSON data, do
//
//     final collectors = collectorsFromJson(jsonString);

import 'dart:convert';

Collectors collectorsFromJson(String str) => Collectors.fromJson(json.decode(str));

String collectorsToJson(Collectors data) => json.encode(data.toJson());

class Collectors {
  Collectors({
    this.collectors,
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

  List<Collector> collectors;
  int totalDocs;
  int limit;
  int totalPages;
  int page;
  int pagingCounter;
  bool hasPrevPage;
  bool hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  factory Collectors.fromJson(Map<String, dynamic> json) => Collectors(
        collectors: json["docs"] == null ? null : List<Collector>.from(json["docs"].map((x) => Collector.fromJson(x))),
        totalDocs: json["totalDocs"] == null ? null : json["totalDocs"],
        limit: json["limit"] == null ? null : json["limit"],
        totalPages: json["totalPages"] == null ? null : json["totalPages"],
        page: json["page"] == null ? null : json["page"],
        pagingCounter: json["pagingCounter"] == null ? null : json["pagingCounter"],
        hasPrevPage: json["hasPrevPage"] == null ? null : json["hasPrevPage"],
        hasNextPage: json["hasNextPage"] == null ? null : json["hasNextPage"],
        prevPage: json["prevPage"],
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "docs": collectors == null ? null : List<dynamic>.from(collectors.map((x) => x.toJson())),
        "totalDocs": totalDocs == null ? null : totalDocs,
        "limit": limit == null ? null : limit,
        "totalPages": totalPages == null ? null : totalPages,
        "page": page == null ? null : page,
        "pagingCounter": pagingCounter == null ? null : pagingCounter,
        "hasPrevPage": hasPrevPage == null ? null : hasPrevPage,
        "hasNextPage": hasNextPage == null ? null : hasNextPage,
        "prevPage": prevPage,
        "nextPage": nextPage,
      };
}

class Collector {
  Collector({
    this.id,
    this.name,
    this.phoneNumber,
    this.slug,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String name;
  String phoneNumber;
  String slug;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Collector.fromJson(Map<String, dynamic> json) => Collector(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        slug: json["slug"] == null ? null : json["slug"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "slug": slug == null ? null : slug,
        "createdBy": createdBy == null ? null : createdBy,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
