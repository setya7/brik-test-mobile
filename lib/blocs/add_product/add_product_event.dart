part of 'add_product_bloc.dart';

sealed class AddProductEvent extends Equatable {
  const AddProductEvent();
}

class AddProduct extends AddProductEvent {
  final ProductModel? body;

  const AddProduct(this.body);

  @override
  List<Object?> get props => [];
}
