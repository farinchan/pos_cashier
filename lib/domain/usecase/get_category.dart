import 'package:dartz/dartz.dart';
import 'package:pos_cashier/domain/enitity/category_entity.dart';
import 'package:pos_cashier/domain/repositories/repository_domain.dart';

class GetCategory {
  final RepositoryDomain repositoryDomain;

  GetCategory({required this.repositoryDomain});

  Future<Either<String, CategoryEntity>> call() async {
    return await repositoryDomain.getCategories();
  }
}
