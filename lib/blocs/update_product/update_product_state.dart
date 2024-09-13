part of 'update_product_bloc.dart';

sealed class UpdateProductState extends Equatable {
  const UpdateProductState();
}

final class UpdateProductInitial extends UpdateProductState {
  @override
  List<Object> get props => [];
}
final class UpdateProductLoading extends UpdateProductState {
  @override
  List<Object> get props => [];
}
final class UpdateProductFailed extends UpdateProductState {
  final String? text;

  const UpdateProductFailed(this.text);

  @override
  List<Object> get props => [];
}
final class UpdateProductSuccess extends UpdateProductState {
  @override
  List<Object> get props => [];
}
