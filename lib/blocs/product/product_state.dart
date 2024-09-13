part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();
}

final class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}
final class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}
final class ProductFailed extends ProductState {
  final String? text;

  const ProductFailed(this.text);

  @override
  List<Object> get props => [];
}
final class ProductSuccess extends ProductState {
  final List<ProductModel> products;

  const ProductSuccess(this.products);

  @override
  List<Object> get props => [];
}

final class ProductSearchSuccess extends ProductState {
  final List<ProductModel> products;

  const ProductSearchSuccess(this.products);

  @override
  List<Object> get props => [];
}
final class ProductLoadmore extends ProductState {
  @override
  List<Object> get props => [];
}
