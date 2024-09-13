/*
 * @Author: christyastama
 * @Date: 12/09/24 at 21.15
 */

import 'package:briktestklontong21/blocs/update_product/update_product_bloc.dart';
import 'package:briktestklontong21/routers/router_name.dart';
import 'package:briktestklontong21/screens/detail_screen.dart';
import 'package:briktestklontong21/screens/home_screen.dart';
import 'package:briktestklontong21/screens/search_product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/add_product/add_product_bloc.dart';
import '../blocs/delete_product/delete_product_bloc.dart';
import '../blocs/product/product_bloc.dart';
import '../models/product_model.dart';
import '../repositories/product_repository.dart';
import '../screens/add_update_product_screen.dart';
import '../screens/splash_screen.dart';

class Pages {
  /// Simplify [MaterialPageRoute]
  static CupertinoPageRoute _materialPageRoute(WidgetBuilder builder, {bool fullscreenDialog = false}) {
    return CupertinoPageRoute(builder: builder, fullscreenDialog: fullscreenDialog);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.splash:
        return _materialPageRoute((context) => const SplashScreen());
      case RouterName.mainHome:
        return _materialPageRoute((context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => ProductBloc(ProductsRepo())..add(GetAllProduct()),
                ),
              ],
              child: const HomeScreen(),
            ));
      case RouterName.detailProduct:
        var arg = settings.arguments as ProductModel;
        return _materialPageRoute((context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => DeleteProductBloc(ProductsRepo()),
                ),
              ],
              child: DetailScreen(productModel: arg),
            ));
      case RouterName.searchProduct:
        return _materialPageRoute((context) => const SearchProductScreen());
      case RouterName.addUpdateProduct:
        var arg = settings.arguments as ProductModel?;
        return _materialPageRoute((context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => AddProductBloc(ProductsRepo()),
                ),
                BlocProvider(
                  create: (context) => UpdateProductBloc(ProductsRepo()),
                ),
              ],
              child: AddUpdateProductScreen(productModel: arg),
            ));
      default:
        return _materialPageRoute((context) => const SizedBox());
    }
  }
}
