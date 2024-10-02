import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pos_cashier/domain/enitity/category_entity.dart';
import 'package:pos_cashier/domain/usecase/get_category.dart';

part 'cashier_category_event.dart';
part 'cashier_category_state.dart';

class CashierCategoryBloc
    extends Bloc<CashierCategoryEvent, CashierCategoryState> {
  GetCategory getCategory;
  CashierCategoryBloc(this.getCategory) : super(CashierCategoryInitial()) {

    on<FetchCategory>((event, emit) async {
      emit(CashierCategoryLoading());
      final result = await getCategory.call();
      result.fold(
        (l) => emit(CashierCategoryFailure(message: l)),
        (r) => emit(CashierCategorySuccess(categories: r.data ?? [])),
      );
    });
  }
}
