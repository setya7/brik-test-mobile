/*
 * @Author: christyastama
 * @Date: 13/09/24 at 21.17
 */

import 'package:bloc_test/bloc_test.dart';
import 'package:briktestklontong21/blocs/product/product_bloc.dart';
import 'package:briktestklontong21/models/product_model.dart';
import 'package:briktestklontong21/repositories/product_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductBloc', () {
    ProductsRepo repo = ProductsRepo();
    late ProductBloc productBloc;

    test('initial state is ProductInitial', () {
      final bloc = ProductBloc(repo);
      expect(bloc.state, ProductInitial());
    });

    test('get data product', () {
      final bloc = ProductBloc(repo);
      blocTest<ProductBloc, ProductState>(
        'emits ProductSuccess with value',
        build: () => bloc,
        act: (cubit) => bloc.add(GetAllProduct()),
        expect: () => [
          ProductSuccess([ProductModel()])
        ],
      );
    });
  });

}
