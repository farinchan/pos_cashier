import 'package:dartz/dartz.dart';
import 'package:pos_cashier/data/datasource/remote_datasource.dart';
import 'package:pos_cashier/domain/enitity/category_entity.dart';
import 'package:pos_cashier/domain/enitity/login_entity.dart';
import 'package:pos_cashier/domain/enitity/product_entity.dart';
import 'package:pos_cashier/domain/repositories/repository_domain.dart';

class RepositoryDomainImpl implements RepositoryDomain {
  final RemoteDataSource remoteDataSource;

  RepositoryDomainImpl({required this.remoteDataSource});

  @override
  Future<Either<String, LoginEntity>> login(
      String emailOrUsername, String password) async {
    try {
      var result = await remoteDataSource.login(emailOrUsername, password);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, CategoryEntity>> getCategories() async {
    try {
      var result = await remoteDataSource.getCategories();
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, ProductEntity>> getProducts(
      String query,  String categoryId) async {
    try {
      var result =
          await remoteDataSource.getProducts(query, categoryId);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
