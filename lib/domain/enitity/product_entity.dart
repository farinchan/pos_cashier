import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final bool? success;
  final String? message;
  final List<DatumEntity>? data;

  ProductEntity({
    this.success,
    this.message,
    this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [success, message, data];
}

class DatumEntity extends Equatable {
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

  DatumEntity({
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
