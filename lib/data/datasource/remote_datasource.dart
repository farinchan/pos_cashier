import 'package:pos_cashier/data/models/category_model.dart';
import 'package:pos_cashier/data/models/login_model.dart';
import 'package:pos_cashier/data/models/product_model.dart';

abstract class RemoteDataSource {
  Future<LoginModel> login(String emailOrUsername, String password);

  Future<CategoryModel> getCategories();

  Future<ProductModel> getProducts(String query, String categoryId);
}
