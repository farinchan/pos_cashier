import 'package:equatable/equatable.dart';
import 'package:pos_cashier/domain/enitity/login_entity.dart';

class LoginModel extends Equatable {
  final int? response;
  final bool? success;
  final String? message;
  final Validation? validation;
  final LoginModelData? data;

  const LoginModel({
    this.response,
    this.success,
    this.message,
    this.validation,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        response: json["response"],
        success: json["success"],
        message: json["message"],
        validation: json["validation"] == null
            ? null
            : Validation.fromJson(json["validation"]),
        data:
            json["data"] == null ? null : LoginModelData.fromJson(json["data"]),
      );

  LoginEntity toEntity() => LoginEntity(
        response: response,
        success: success,
        message: message,
        validation: validation?.toEntity(),
        data: data?.toEntity(),
      );

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, validation, data];
}

class LoginModelData extends Equatable {
  final DataData? data;
  final String? accessToken;
  final String? tokenType;

  const LoginModelData({
    this.data,
    this.accessToken,
    this.tokenType,
  });

  factory LoginModelData.fromJson(Map<String, dynamic> json) => LoginModelData(
        data: json["data"] == null ? null : DataData.fromJson(json["data"]),
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );

  LoginDataEntity toEntity() => LoginDataEntity(
        data: data?.toEntity(),
        accessToken: accessToken,
        tokenType: tokenType,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [data, accessToken, tokenType];
}

class DataData extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final String? emailVerifiedAt;
  final int? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const DataData({
    this.id,
    this.name,
    this.email,
    this.username,
    this.emailVerifiedAt,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        emailVerifiedAt: json["email_verified_at"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  DataDataEntity toEntity() => DataDataEntity(
        id: id,
        name: name,
        email: email,
        username: username,
        emailVerifiedAt: emailVerifiedAt,
        isActive: isActive,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        email,
        username,
        emailVerifiedAt,
        isActive,
        createdAt,
        updatedAt
      ];
}

class Validation extends Equatable {
  final List<dynamic>? emailOrUsername;
  final List<dynamic>? password;

  const Validation({
    this.emailOrUsername,
    this.password,
  });

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        emailOrUsername: json["email_or_username"] == null
            ? []
            : List<dynamic>.from(json["email_or_username"]!.map((x) => x)),
        password: json["password"] == null
            ? []
            : List<dynamic>.from(json["password"]!.map((x) => x)),
      );

  ValidationEntity toEntity() => ValidationEntity(
        emailOrUsername: emailOrUsername,
        password: password,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [emailOrUsername, password];
}
