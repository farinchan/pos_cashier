import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pos_cashier/domain/enitity/product_entity.dart';
import 'package:pos_cashier/domain/usecase/get_product.dart';

part 'cashier_product_event.dart';
part 'cashier_product_state.dart';

class CashierProductBloc
    extends Bloc<CashierProductEvent, CashierProductState> {
  GetProduct getProduct;
  CashierProductBloc(this.getProduct) : super(CashierProductInitial()) {
    
    String query = '';
    String categoryId = '';

    List<DatumEntity> products = [];

    on<FetchProduct>((event, emit) async {
      emit(CashierProductLoading());
      query = event.search ?? "";
      categoryId = event.category ?? "";
      final result = await getProduct.call(query, categoryId);
      result.fold((l) => emit(CashierProductFailure(l)), (r) {
        products = r.data!;
        emit(CashierProductSuccess(data: products));
      });
    });
  }
}
