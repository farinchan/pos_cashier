import 'package:dartz/dartz.dart';
import 'package:pos_cashier/domain/enitity/product_entity.dart';
import 'package:pos_cashier/domain/repositories/repository_domain.dart';

class GetProduct {
  final RepositoryDomain repositoryDomain;

  GetProduct({required this.repositoryDomain});

  Future<Either<String, ProductEntity>> call(
      String query, String categoryId) async {
    return await repositoryDomain.getProducts(query,  categoryId);
  }
}
