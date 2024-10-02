part of 'cashier_category_bloc.dart';

sealed class CashierCategoryState extends Equatable {
  const CashierCategoryState();
  
  @override
  List<Object> get props => [];
}

final class CashierCategoryInitial extends CashierCategoryState {}

final class CashierCategoryLoading extends CashierCategoryState {}

final class CashierCategorySuccess extends CashierCategoryState {
  final List<DatumEntity> categories;

  const CashierCategorySuccess({required this.categories});

  @override
  List<Object> get props => [categories];
}

final class CashierCategoryFailure extends CashierCategoryState {
  final String message;

  const CashierCategoryFailure({required this.message});

  @override
  List<Object> get props => [message];
}

