import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pos_cashier/data/datasource/remote/remote_datasource_impl.dart';
import 'package:pos_cashier/data/datasource/remote_datasource.dart';
import 'package:pos_cashier/data/repositories/repository_domain_impl.dart';
import 'package:pos_cashier/domain/repositories/repository_domain.dart';
import 'package:pos_cashier/domain/usecase/get_category.dart';
import 'package:pos_cashier/domain/usecase/get_login.dart';
import 'package:pos_cashier/domain/usecase/get_product.dart';
import 'package:pos_cashier/presentation/bloc/cart/cart_bloc.dart';
import 'package:pos_cashier/presentation/bloc/cashier_category/cashier_category_bloc.dart';
import 'package:pos_cashier/presentation/bloc/cashier_product/cashier_product_bloc.dart';

final getIt = GetIt.instance;

void init() {
  //bloc
  getIt.registerFactory(() => CashierCategoryBloc(getIt()));
  getIt.registerFactory(() => CashierProductBloc(getIt()));
  getIt.registerFactory(() => CartBloc());

  //usecase
  getIt.registerLazySingleton(() => GetLogin(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetCategory(repositoryDomain: getIt()));
  getIt.registerLazySingleton(() => GetProduct(repositoryDomain: getIt()));

  //repository
  getIt.registerLazySingleton<RepositoryDomain>(
      () => RepositoryDomainImpl(remoteDataSource: getIt()));

  // Data sources
  getIt.registerLazySingleton<RemoteDataSource>(
      () => RemoteDatasourceImpl(client: getIt()));

  // Http service
  getIt.registerLazySingleton(() => http.Client());
}
