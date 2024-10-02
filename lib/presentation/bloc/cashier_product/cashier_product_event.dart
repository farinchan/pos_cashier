part of 'cashier_product_bloc.dart';

sealed class CashierProductEvent extends Equatable {
  const CashierProductEvent();

  @override
  List<Object> get props => [];
}

final class FetchProduct extends CashierProductEvent {
  final String? category;
  final String? search;

  const FetchProduct({this.category, this.search});

  @override
  List<Object> get props => [category ?? '', search ?? ''];
}