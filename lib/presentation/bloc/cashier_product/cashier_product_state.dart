part of 'cashier_product_bloc.dart';

sealed class CashierProductState extends Equatable {
  const CashierProductState();

  @override
  List<Object> get props => [];
}

final class CashierProductInitial extends CashierProductState {}

final class CashierProductLoading extends CashierProductState {}

final class CashierProductSuccess extends CashierProductState {
  final List<DatumEntity> data;

  const CashierProductSuccess({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

final class CashierProductFailure extends CashierProductState {
  final String message;

  const CashierProductFailure(this.message);

  @override
  List<Object> get props => [message];
}
