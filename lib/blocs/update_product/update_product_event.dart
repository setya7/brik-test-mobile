part of 'update_product_bloc.dart';

sealed class UpdateProductEvent extends Equatable {
  const UpdateProductEvent();
}

class UpdateProduct extends UpdateProductEvent {
  final ProductModel? productModel;

  const UpdateProduct(this.productModel);

  @override
  List<Object?> get props => [];
}
