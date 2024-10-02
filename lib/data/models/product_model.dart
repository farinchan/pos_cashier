import 'package:equatable/equatable.dart';
import 'package:pos_cashier/domain/enitity/product_entity.dart';

class ProductModel extends Equatable {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  ProductModel({
    this.success,
    this.message,
    this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  ProductEntity toEntity() => ProductEntity(
      success: success,
      message: message,
      data: data?.map((e) => e.toEntity()).toList());

  @override
  // TODO: implement props
  List<Object?> get props => [success, message,  data];
}

class Datum extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final int? price;
  final int? stock;
  final String? category;
  final String? image;
  final String? barcode;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stock,
    this.category,
    this.image,
    this.barcode,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stock: json["stock"],
        category: json["category"],
        image: json["image"],
        barcode: json["barcode"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  DatumEntity toEntity() => DatumEntity(
        id: id,
        name: name,
        description: description,
        price: price,
        stock: stock,
        category: category,
        image: image,
        barcode: barcode,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        stock,
        category,
        image,
        barcode,
        createdAt,
        updatedAt
      ];
}
