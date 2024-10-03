import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    List<Map<String, dynamic>> carts = [];
    num total = 0;

    on<AddProduct>((event, emit) {
      emit(CartLoading());
      if (carts.indexWhere((element) => element['id'] == event.id) != -1) {
        final index = carts.indexWhere((element) => element['id'] == event.id);
        total += carts[index]['price'];
        carts[index]['quantity'] += 1;
        carts[index]['price_total'] += carts[index]['price'];
      } else {
        carts.add({
          'id': event.id,
          'name': event.name,
          'price': event.price,
          'quantity': 1,
          'price_total': event.price,
        });
        total += event.price;
      }
      emit(CartLoaded(carts: carts, total: total));
    });

    on<RemoveProduct>((event, emit) {
      emit(CartLoading());
      final index = carts.indexWhere((element) => element['id'] == event.id);
      total -= carts[index]['price'];
      carts.removeAt(index);
      emit(CartLoaded(carts: carts, total: total));
    });

    on<IncrementProduct>((event, emit) {
      emit(CartLoading());
      final index = carts.indexWhere((element) => element['id'] == event.id);
      total += carts[index]['price'];
      carts[index]['quantity'] += 1;
      carts[index]['price_total'] += carts[index]['price'];
      emit(CartLoaded(carts: carts, total: total));
      log(carts.toString());
    });

    on<DecrementProduct>((event, emit) {
      emit(CartLoading());
      final index = carts.indexWhere((element) => element['id'] == event.id);
      total -= carts[index]['price'];
      carts[index]['quantity'] -= 1;
      carts[index]['price_total'] -= carts[index]['price'];
      if (carts[index]['quantity'] == 0) {
        carts.removeAt(index);
      }
      emit(CartLoaded(carts: carts, total: total));
    });

    on<ClearCart>((event, emit) {
      emit(CartLoading());
      carts = [];
      total = 0;
      emit(CartLoaded(carts: carts, total: total));
    });

    on<Checkout>((event, emit) {
      emit(CartLoading());
      carts = [];
      total = 0;
      emit(CartLoaded(carts: carts, total: total));
    });
  }
}
