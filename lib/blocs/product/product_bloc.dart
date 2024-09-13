import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../../repositories/product_repository.dart';
import '../../x_src/x_helper.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsRepo repo;
  List<ProductModel> products = [];

  final etSearchProduct = TextEditingController();

  ProductBloc(this.repo) : super(ProductInitial()) {
    on<GetAllProduct>((event, emit) async {
      emit(products.isEmpty ? ProductLoading() : ProductLoadmore());
      try {
        var response = await repo.getProducts();
        logger.w(response);
        if (response.data != null) {
          emit(ProductSuccess(response.data ?? []));
        } else if (response.data != null && response.statusCode != 200) {
          emit(const ProductFailed("Get Product failed"));
        } else {
          emit(const ProductFailed("Get Product failed"));
        }
      } catch (e) {
        emit(const ProductFailed("Get Product failed"));
      }
    }, transformer: droppable());

    on<SearchProduct>((event, emit) async {
      final suggestion = products.where((element) {
        final name = element.name!.toLowerCase();
        final input = event.keyword?.toLowerCase();
        return name.contains(input!);
      }).toList();
      debugPrint("suggestion : ${suggestion.length}");
      products = suggestion;
      emit(ProductSearchSuccess(suggestion));

      logger.i(suggestion.map((e) => e.name).toList());
    }, transformer: droppable());
  }

  searchProduct(String? keyword) {
    final suggestion = products.where((element) {
      final categoryName = element.name!.toLowerCase();
      final input = keyword?.toLowerCase();
      return categoryName.contains(input!);
    }).toList();
    debugPrint("suggestion : ${suggestion.length}");
    products = suggestion;
  }
}
