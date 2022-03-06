// To parse this JSON data, do
//
//     final promotion = promotionFromJson(jsonString);

import 'dart:convert';

Promotion promotionFromJson(String str) => Promotion.fromJson(json.decode(str));

String promotionToJson(Promotion data) => json.encode(data.toJson());

class Promotion {
  Promotion({
    required this.id,
    required this.category,
    required this.user,
    required this.title,
    required this.store,
    required this.description,
    required this.price,
    required this.url,
    required this.image,
    required this.score,
    required this.createdAt,
    required this.updateAt,
  });

  int id;
  String category;
  String user;
  String title;
  String store;
  String description;
  String price;
  String url;
  String image;
  int score;
  DateTime createdAt;
  DateTime updateAt;

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        id: json["id"],
        category: json["category"],
        user: json["user"],
        title: json["title"],
        store: json["store"],
        description: json["description"],
        price: json["price"],
        url: json["url"],
        image: json["image"],
        score: json["score"],
        createdAt: DateTime.parse(json["createdAt"]),
        updateAt: DateTime.parse(json["updateAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "user": user,
        "title": title,
        "store": store,
        "description": description,
        "price": price,
        "url": url,
        "image": image,
        "score": score,
        "createdAt": createdAt.toIso8601String(),
        "updateAt": updateAt.toIso8601String(),
      };
}
