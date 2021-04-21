// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
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

  List<Product> docs;
  int totalDocs;
  int limit;
  int totalPages;
  int page;
  int pagingCounter;
  bool hasPrevPage;
  bool hasNextPage;
  dynamic prevPage;
  dynamic nextPage;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        docs: json["docs"] == null ? null : List<Product>.from(json["docs"].map((x) => Product.fromJson(x))),
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
        "docs": docs == null ? null : List<dynamic>.from(docs.map((x) => x.toJson())),
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

class Product {
  Product({
    this.displayImage,
    this.isHamper,
    this.active,
    this.step,
    this.isFeatured,
    this.hits,
    this.approved,
    this.deleted,
    this.tags,
    this.id,
    this.town,
    this.name,
    this.description,
    this.price,
    this.category,
    this.slug,
    this.createdBy,
    this.currency,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  DisplayImage displayImage;
  bool isHamper;
  bool active;
  int step;
  bool isFeatured;
  int hits;
  bool approved;
  bool deleted;
  List<Tag> tags;
  String id;
  Category town;
  String name;
  String description;
  double price;
  Category category;
  String slug;
  String createdBy;
  Currency currency;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        displayImage: json["displayImage"] == null ? null : DisplayImage.fromJson(json["displayImage"]),
        isHamper: json["isHamper"] == null ? null : json["isHamper"],
        active: json["active"] == null ? null : json["active"],
        step: json["step"] == null ? null : json["step"],
        isFeatured: json["isFeatured"] == null ? null : json["isFeatured"],
        hits: json["hits"] == null ? null : json["hits"],
        approved: json["approved"] == null ? null : json["approved"],
        deleted: json["deleted"] == null ? null : json["deleted"],
        tags: json["tags"] == null ? null : List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        id: json["_id"] == null ? null : json["_id"],
        town: json["town"] == null ? null : Category.fromJson(json["town"]),
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        price: json["price"] == null ? null : (json["price"].runtimeType == int ? double.parse('${json["price"]}') : json["price"]),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        slug: json["slug"] == null ? null : json["slug"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "displayImage": displayImage == null ? null : displayImage.toJson(),
        "isHamper": isHamper == null ? null : isHamper,
        "active": active == null ? null : active,
        "step": step == null ? null : step,
        "isFeatured": isFeatured == null ? null : isFeatured,
        "hits": hits == null ? null : hits,
        "approved": approved == null ? null : approved,
        "deleted": deleted == null ? null : deleted,
        "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x.toJson())),
        "_id": id == null ? null : id,
        "town": town == null ? null : town.toJson(),
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "price": price == null ? null : price,
        "category": category == null ? null : category.toJson(),
        "slug": slug == null ? null : slug,
        "createdBy": createdBy == null ? null : createdBy,
        "currency": currency == null ? null : currency.toJson(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String name;
  String slug;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "createdBy": createdBy == null ? null : createdBy,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Currency {
  Currency({
    this.defaultCurrency,
    this.id,
    this.name,
    this.acronym,
    this.symbol,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  bool defaultCurrency;
  String id;
  String name;
  String acronym;
  String symbol;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        defaultCurrency: json["defaultCurrency"] == null ? null : json["defaultCurrency"],
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        acronym: json["acronym"] == null ? null : json["acronym"],
        symbol: json["symbol"] == null ? null : json["symbol"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "defaultCurrency": defaultCurrency == null ? null : defaultCurrency,
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "acronym": acronym == null ? null : acronym,
        "symbol": symbol == null ? null : symbol,
        "createdBy": createdBy == null ? null : createdBy,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class DisplayImage {
  DisplayImage({
    this.original,
    this.thumbnail,
  });

  String original;
  String thumbnail;

  static String storageUrl = 'https://storage.watumirahere.com';

  factory DisplayImage.fromJson(Map<String, dynamic> json) => DisplayImage(
        original: json["original"] == null ? null : '$storageUrl/${json["original"]}',
        thumbnail: json["thumbnail"] == null ? null : '$storageUrl/${json["thumbnail"]}',
      );

  Map<String, dynamic> toJson() => {
        "original": original == null ? null : original,
        "thumbnail": thumbnail == null ? null : thumbnail,
      };
}

class Tag {
  Tag({
    this.id,
    this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String name;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
