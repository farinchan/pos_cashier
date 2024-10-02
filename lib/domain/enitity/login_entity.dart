import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final int? response;
  final bool? success;
  final String? message;
  final ValidationEntity? validation;
  final LoginDataEntity? data;

  const LoginEntity({
    this.response,
    this.success,
    this.message,
    this.validation,
    this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [response, success, message, validation, data];
}

class LoginDataEntity extends Equatable {
  final DataDataEntity? data;
  final String? accessToken;
  final String? tokenType;

  const LoginDataEntity({
    this.data,
    this.accessToken,
    this.tokenType,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [data, accessToken, tokenType];
}

class DataDataEntity extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final String? emailVerifiedAt;
  final int? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const DataDataEntity({
    this.id,
    this.name,
    this.email,
    this.username,
    this.emailVerifiedAt,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

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

class ValidationEntity extends Equatable {
  final List<dynamic>? emailOrUsername;
  final List<dynamic>? password;

  const ValidationEntity({
    this.emailOrUsername,
    this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [emailOrUsername, password];
}
