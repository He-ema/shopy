import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopy/features/home/data/product_model/product_model.dart';
import 'package:shopy/features/home/data/repos/home_repo.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this.homeRepo) : super(GetProductsInitial());

  final HomeRepo homeRepo;
  Future<void> getAllProduct() async {
    emit(GetProductsLoading());
    var result = await homeRepo.getProducts();
    result.fold((failure) {
      emit(GetProductsFailure(failure.errorMessage));
    }, (products) {
      emit(GetProductsSuccess(products));
    });
  }
}
