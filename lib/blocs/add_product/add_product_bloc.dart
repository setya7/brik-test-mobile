import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

import '../../models/product_model.dart';
import '../../repositories/product_repository.dart';
import '../../x_src/x_helper.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  final ProductsRepo repo;

  AddProductBloc(this.repo) : super(AddProductInitial()) {
    on<AddProduct>((event, emit) async {
      emit(AddProductLoading());
      try {
        var response = await repo.addProducts(event.body);
        logger.w(response.data?.toJson());
        if (response.data != null) {
          emit(AddProductSuccess());
        } else if (response.data != null && response.statusCode != 200) {
          emit(const AddProductFailed("Add Product failed"));
        } else {
          emit(const AddProductFailed("Add Product failed"));
        }
      } catch (e) {
        emit(const AddProductFailed("Add Product failed"));
      }
    }, transformer: droppable());
  }
}
