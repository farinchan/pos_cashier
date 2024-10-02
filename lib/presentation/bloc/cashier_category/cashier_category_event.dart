part of 'cashier_category_bloc.dart';

sealed class CashierCategoryEvent extends Equatable {
  const CashierCategoryEvent();

  @override
  List<Object> get props => [];
}

final class FetchCategory extends CashierCategoryEvent {
  const FetchCategory();

  @override
  List<Object> get props => [];
}

