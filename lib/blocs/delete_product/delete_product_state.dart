part of 'delete_product_bloc.dart';

sealed class DeleteProductState extends Equatable {
  const DeleteProductState();
}

final class DeleteProductInitial extends DeleteProductState {
  @override
  List<Object> get props => [];
}
final class DeleteProductLoading extends DeleteProductState {
  @override
  List<Object> get props => [];
}
final class DeleteProductSuccess extends DeleteProductState {
  @override
  List<Object> get props => [];
}
final class DeleteProductFailed extends DeleteProductState {
  final String? text;

  const DeleteProductFailed(this.text);

  @override
  List<Object> get props => [];
}
