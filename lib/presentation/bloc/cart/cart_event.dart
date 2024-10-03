part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class AddProduct extends CartEvent {
  final int id;
  final String name;
  final int quantity;
  final int price;

  const AddProduct({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  @override
  List<Object> get props => [id, quantity, price];
}

final class RemoveProduct extends CartEvent {
  final int id;

  const RemoveProduct({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

final class IncrementProduct extends CartEvent {
  final int id;

  const IncrementProduct({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

final class DecrementProduct extends CartEvent {
  final int id;

  const DecrementProduct({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

final class ClearCart extends CartEvent {}

final class Checkout extends CartEvent {
  final int paid;

  const Checkout({
    required this.paid,
  });

  @override
  List<Object> get props => [paid];
}
