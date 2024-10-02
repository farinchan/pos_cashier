import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final bool? success;
  final String? message;
  final List<DatumEntity>? data;

  CategoryEntity({
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
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DatumEntity({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, description, createdAt, updatedAt];
}
