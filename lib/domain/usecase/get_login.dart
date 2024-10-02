import 'package:dartz/dartz.dart';
import 'package:pos_cashier/domain/enitity/login_entity.dart';
import 'package:pos_cashier/domain/repositories/repository_domain.dart';

class GetLogin {
  final RepositoryDomain repositoryDomain;

  GetLogin({required this.repositoryDomain});

  Future<Either<String, LoginEntity>> call(
      String emailOrUsername, String password) async {
    return await repositoryDomain.login(emailOrUsername, password);
  }
}
