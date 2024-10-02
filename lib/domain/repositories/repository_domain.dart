import 'package:dartz/dartz.dart';
import 'package:pos_cashier/domain/enitity/category_entity.dart';
import 'package:pos_cashier/domain/enitity/login_entity.dart';
import 'package:pos_cashier/domain/enitity/product_entity.dart';

abstract class RepositoryDomain {
  Future<Either<String, LoginEntity>> login(
      String emailOrUsername, String password);

  Future<Either<String, CategoryEntity>> getCategories();

  Future<Either<String, ProductEntity>> getProducts(
      String query, String categoryId);
}
