part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoaded extends CartState {
  final List carts;
  final num total;

  const CartLoaded({
    required this.carts,
    required this.total,
  });

  @override
  List<Object> get props => [carts];
}

final class CartLoading extends CartState {}
