import 'dart:convert';

import 'package:pos_cashier/common/constant.dart';
import 'package:pos_cashier/data/datasource/remote_datasource.dart';
import 'package:pos_cashier/data/models/category_model.dart';
import 'package:pos_cashier/data/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:pos_cashier/data/models/product_model.dart';

class RemoteDatasourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDatasourceImpl({required this.client});

  @override
  Future<LoginModel> login(String emailOrUsername, String password) async {
    var response = await client.post(
      Uri.parse('${Constant.baseUrl}/auth/login'),
      body: {
        'email_or_username': emailOrUsername,
        'password': password,
      },
    );
    return LoginModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<CategoryModel> getCategories() async {
    var response = await client.get(
      Uri.parse('${Constant.baseUrl}/categories'),
    );

    return CategoryModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<ProductModel> getProducts(String query, String categoryId) async {
    var response = await client.get(
      Uri.parse('${Constant.baseUrl}/products'),
    );

    return ProductModel.fromJson(jsonDecode(response.body));
  }
}
