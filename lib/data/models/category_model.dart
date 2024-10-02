import 'package:equatable/equatable.dart';
import 'package:pos_cashier/domain/enitity/category_entity.dart';

class CategoryModel extends Equatable {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  CategoryModel({
    this.success,
    this.message,
    this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  CategoryEntity toEntity() => CategoryEntity(
      success: success,
      message: message,
      data: data?.map((e) => e.toEntity()).toList());

  @override
  // TODO: implement props
  List<Object?> get props => [success, message, data];
}

class Datum extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
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
      createdAt: createdAt,
      updatedAt: updatedAt,);

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, description, createdAt, updatedAt];
}


