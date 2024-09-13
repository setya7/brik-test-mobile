/*
 * @Author: christyastama
 * @Date: 13/09/24 at 12.52
 */

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  String? id;
  dynamic categoryId;
  String? categoryName;
  String? sku;
  String? name;
  String? description;
  int? weight;
  int? width;
  int? length;
  int? height;
  String? image;
  int? price;

  ProductModel({
    this.id,
    this.categoryId,
    this.categoryName,
    this.sku,
    this.name,
    this.description,
    this.weight,
    this.width,
    this.length,
    this.height,
    this.image,
    this.price,
  });

  ProductModel copyWith({
    String? id,
    dynamic categoryId,
    String? categoryName,
    String? sku,
    String? name,
    String? description,
    int? weight,
    int? width,
    int? length,
    int? height,
    String? image,
    int? price,
  }) =>
      ProductModel(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        sku: sku ?? this.sku,
        name: name ?? this.name,
        description: description ?? this.description,
        weight: weight ?? this.weight,
        width: width ?? this.width,
        length: length ?? this.length,
        height: height ?? this.height,
        image: image ?? this.image,
        price: price ?? this.price,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["_id"],
    categoryId: json["categoryId"],
    categoryName: json["categoryName"],
    sku: json["sku"],
    name: json["name"],
    description: json["description"],
    weight: json["weight"],
    width: json["width"],
    length: json["length"],
    height: json["height"],
    image: json["image"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "categoryId": categoryId,
    "categoryName": categoryName,
    "sku": sku,
    "name": name,
    "description": description,
    "weight": weight,
    "width": width,
    "length": length,
    "height": height,
    "image": image,
    "price": price,
  };
}
