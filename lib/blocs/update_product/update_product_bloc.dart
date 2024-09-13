import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:briktestklontong21/models/product_model.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/product_repository.dart';
import '../../x_src/x_helper.dart';

part 'update_product_event.dart';
part 'update_product_state.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  final ProductsRepo repo;

  UpdateProductBloc(this.repo) : super(UpdateProductInitial()) {
    on<UpdateProduct>((event, emit) async {
      emit(UpdateProductLoading());
      try {
        var response = await repo.updateProducts(event.productModel);
        logger.w(response.data);
        if (response.data != null) {
          emit(UpdateProductSuccess());
        } else if (response.data != null && response.statusCode != 200) {
          emit(const UpdateProductFailed("Update Product failed"));
        } else {
          emit(const UpdateProductFailed("Update Product failed"));
        }
      } catch (e) {
        emit(const UpdateProductFailed("Update Product failed"));
      }
    }, transformer: droppable());
  }
}
