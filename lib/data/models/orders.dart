// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));

String ordersToJson(Orders data) => json.encode(data.toJson());

class Orders {
  Orders({
    this.orders,
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

  List<Order> orders;
  int totalDocs;
  int limit;
  int totalPages;
  int page;
  int pagingCounter;
  bool hasPrevPage;
  bool hasNextPage;
  dynamic prevPage;
  int nextPage;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        orders: json["docs"] == null ? null : List<Order>.from(json["docs"].map((x) => Order.fromJson(x))),
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
        "docs": orders == null ? null : List<dynamic>.from(orders.map((x) => x.toJson())),
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

class Order {
  Order({
    this.stage,
    this.paymentStatus,
    this.deleted,
    this.id,
    this.customer,
    this.cart,
    this.collectionPoint,
    this.collector,
    this.refCode,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  int stage;
  String paymentStatus;
  bool deleted;
  String id;
  Customer customer;
  Cart cart;
  CollectionPoint collectionPoint;
  Collector collector;
  String refCode;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        stage: json["stage"] == null ? null : json["stage"],
        paymentStatus: json["paymentStatus"] == null ? null : json["paymentStatus"],
        deleted: json["deleted"] == null ? null : json["deleted"],
        id: json["_id"] == null ? null : json["_id"],
        customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
        cart: json["cart"] == null ? null : Cart.fromJson(json["cart"]),
        collectionPoint: json["collectionPoint"] == null ? null : CollectionPoint.fromJson(json["collectionPoint"]),
        collector: json["collector"] == null ? null : Collector.fromJson(json["collector"]),
        refCode: json["refCode"] == null ? null : json["refCode"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "stage": stage == null ? null : stage,
        "paymentStatus": paymentStatus == null ? null : paymentStatus,
        "deleted": deleted == null ? null : deleted,
        "_id": id == null ? null : id,
        "customer": customer == null ? null : customer.toJson(),
        "cart": cart == null ? null : cart.toJson(),
        "collectionPoint": collectionPoint == null ? null : collectionPoint.toJson(),
        "collector": collector == null ? null : collector.toJson(),
        "refCode": refCode == null ? null : refCode,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Cart {
  Cart({
    this.checkedOut,
    this.items,
    this.id,
    this.currency,
    this.town,
    this.createdBy,
    this.subTotal,
    this.serviceFee,
    this.total,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  bool checkedOut;
  List<Item> items;
  String id;
  Currency currency;
  Town town;
  String createdBy;
  double subTotal;
  double serviceFee;
  double total;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        checkedOut: json["checkedOut"] == null ? null : json["checkedOut"],
        items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        id: json["_id"] == null ? null : json["_id"],
        currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
        town: json["town"] == null ? null : Town.fromJson(json["town"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        subTotal: json["subTotal"] == null ? null : json["subTotal"].toDouble(),
        serviceFee: json["serviceFee"] == null ? null : json["serviceFee"].toDouble(),
        total: json["total"] == null ? null : json["total"].toDouble(),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "checkedOut": checkedOut == null ? null : checkedOut,
        "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
        "_id": id == null ? null : id,
        "currency": currency == null ? null : currency.toJson(),
        "town": town == null ? null : town.toJson(),
        "createdBy": createdBy == null ? null : createdBy,
        "subTotal": subTotal == null ? null : subTotal,
        "serviceFee": serviceFee == null ? null : serviceFee,
        "total": total == null ? null : total,
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

class Item {
  Item({
    this.id,
    this.quantity,
    this.cart,
    this.product,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  int quantity;
  String cart;
  Product product;
  double price;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["_id"] == null ? null : json["_id"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        cart: json["cart"] == null ? null : json["cart"],
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
        price: json["price"] == null ? null : json["price"].toDouble(),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "quantity": quantity == null ? null : quantity,
        "cart": cart == null ? null : cart,
        "product": product == null ? null : product.toJson(),
        "price": price == null ? null : price,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
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
  List<String> tags;
  String id;
  String town;
  String name;
  String description;
  double price;
  String category;
  String slug;
  String createdBy;
  String currency;
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
        tags: json["tags"] == null ? null : List<String>.from(json["tags"].map((x) => x)),
        id: json["_id"] == null ? null : json["_id"],
        town: json["town"] == null ? null : json["town"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        category: json["category"] == null ? null : json["category"],
        slug: json["slug"] == null ? null : json["slug"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        currency: json["currency"] == null ? null : json["currency"],
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
        "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x)),
        "_id": id == null ? null : id,
        "town": town == null ? null : town,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "price": price == null ? null : price,
        "category": category == null ? null : category,
        "slug": slug == null ? null : slug,
        "createdBy": createdBy == null ? null : createdBy,
        "currency": currency == null ? null : currency,
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

  factory DisplayImage.fromJson(Map<String, dynamic> json) => DisplayImage(
        original: json["original"] == null ? null : json["original"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "original": original == null ? null : original,
        "thumbnail": thumbnail == null ? null : thumbnail,
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
  });

  String id;
  String name;
  String slug;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Town.fromJson(Map<String, dynamic> json) => Town(
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

class Customer {
  Customer({
    this.middleName,
    this.isVerified,
    this.id,
    this.firstName,
    this.lastName,
    this.identifier,
    this.authType,
    this.createdAt,
    this.updatedAt,
    this.fullName,
    this.v,
    this.displayImage,
  });

  String middleName;
  bool isVerified;
  String id;
  String firstName;
  String lastName;
  String identifier;
  String authType;
  DateTime createdAt;
  DateTime updatedAt;
  String fullName;
  int v;
  DisplayImage displayImage;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        middleName: json["middleName"] == null ? null : json["middleName"],
        isVerified: json["isVerified"] == null ? null : json["isVerified"],
        id: json["_id"] == null ? null : json["_id"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        identifier: json["identifier"] == null ? null : json["identifier"],
        authType: json["authType"] == null ? null : json["authType"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        fullName: json["fullName"] == null ? null : json["fullName"],
        v: json["__v"] == null ? null : json["__v"],
        displayImage: json["displayImage"] == null ? null : DisplayImage.fromJson(json["displayImage"]),
      );

  Map<String, dynamic> toJson() => {
        "middleName": middleName == null ? null : middleName,
        "isVerified": isVerified == null ? null : isVerified,
        "_id": id == null ? null : id,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "identifier": identifier == null ? null : identifier,
        "authType": authType == null ? null : authType,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "fullName": fullName == null ? null : fullName,
        "__v": v == null ? null : v,
        "displayImage": displayImage == null ? null : displayImage.toJson(),
      };
}
