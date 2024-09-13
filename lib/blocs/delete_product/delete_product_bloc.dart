import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/product_repository.dart';
import '../../x_src/x_helper.dart';

part 'delete_product_event.dart';
part 'delete_product_state.dart';

class DeleteProductBloc extends Bloc<DeleteProductEvent, DeleteProductState> {
  final ProductsRepo repo;

  DeleteProductBloc(this.repo) : super(DeleteProductInitial()) {
    on<DeleteProduct>((event, emit) async {
      emit(DeleteProductLoading());
      try {
        var response = await repo.deleteProducts(event.id);
        logger.w(response.data);
        if (response.statusCode == 200) {
          emit(DeleteProductSuccess());
        } else if (response.statusCode != 200) {
          emit(const DeleteProductFailed("Failed delete product"));
        } else {
          emit(const DeleteProductFailed("Failed delete product"));
        }
      } catch (e) {
        emit(const DeleteProductFailed("Failed delete product"));
      }
    }, transformer: droppable());
  }
}
