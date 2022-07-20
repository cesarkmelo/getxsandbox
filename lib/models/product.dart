import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.productId,
    required this.name,
    required this.price,
    required this.description,
    required this.ratingAvg,
  });

  final int productId;
  final String name;
  final double price;
  final String description;
  final double ratingAvg;
  bool isFavorite = false;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["Product ID"],
        name: json["Name"],
        price: json["Price"].toDouble(),
        description: json["Description"],
        ratingAvg: json["Rating Avg"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Product ID": productId,
        "Name": name,
        "Price": price,
        "Description": description,
        "Rating Avg": ratingAvg,
      };
}
