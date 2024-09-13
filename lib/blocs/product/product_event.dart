part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetAllProduct extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class SearchProduct extends ProductEvent {
  final String? keyword;

  const SearchProduct(this.keyword);

  @override
  List<Object?> get props => [];
}
