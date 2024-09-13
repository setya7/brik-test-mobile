part of 'add_product_bloc.dart';

sealed class AddProductState extends Equatable {
  const AddProductState();
}

final class AddProductInitial extends AddProductState {
  @override
  List<Object> get props => [];
}
final class AddProductLoading extends AddProductState {
  @override
  List<Object> get props => [];
}
final class AddProductSuccess extends AddProductState {
  @override
  List<Object> get props => [];
}
final class AddProductFailed extends AddProductState {
  final String text;

  const AddProductFailed(this.text);

  @override
  List<Object> get props => [];
}
