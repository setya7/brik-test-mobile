/*
 * @Author: christyastama
 * @Date: 13/09/24 at 12.59
 */

import 'package:briktestklontong21/models/product_model.dart';
import 'package:briktestklontong21/x_src/x_config.dart';
import 'package:dio/dio.dart';

import '../base/service/api.dart';
import '../x_src/x_helper.dart';
import '_main_repository.dart';

abstract class ProductsInterface {
  Future<Response<List<ProductModel>>> getProducts();
  Future<Response<ProductModel>> addProducts(ProductModel? body);
  Future<Response<int?>> deleteProducts(String? id);
  Future<Response<int?>> updateProducts(ProductModel? body);
}

class ProductsRepo implements ProductsInterface {
  @override
  Future<Response<List<ProductModel>>> getProducts() async {
    try {
      var r = await Api.call.get("/api/${XConfig.apiKey}/product");

      return ApiResponse<List<ProductModel>>(r).parse(() => List<ProductModel>.from(r.data.map((x) => ProductModel.fromJson(x))));
    } on DioException catch (e) {
      logger.w(e);
      if (e.response?.data != null) {
        return ApiResponse<List<ProductModel>>(e.response).parse(() => ProductModel.fromJson(e.response!.data));
      } else {
        throw Exception("Response not found");
      }
    } catch (e) {
      logger.w(e);
      return ApiResponse<List<ProductModel>>(null).error("/api/${XConfig.apiKey}/product", errorMessage: e.toString());
    }
  }

  @override
  Future<Response<ProductModel>> addProducts(ProductModel? body) async {
    logger.f(body?.toJson());

    try {
      var r = await Api.call.post("/api/${XConfig.apiKey}/product", data: body?.toJson());
      logger.f(r);

      return ApiResponse<ProductModel>(r).parse(() => ProductModel.fromJson(r.data));
    } on DioException catch (e) {
      logger.w(e);
      if (e.response?.data != null) {
        return ApiResponse<ProductModel>(e.response).parse(() => ProductModel.fromJson(e.response?.data));
      } else {
        throw Exception("Response not found");
      }
    } catch (e) {
      logger.w(e);
      return ApiResponse<ProductModel>(null).error("/api/${XConfig.apiKey}/product", errorMessage: e.toString());
    }
  }

  @override
  Future<Response<int?>> deleteProducts(String? id) async {
    try {
      var r = await Api.call.delete("/api/${XConfig.apiKey}/product/$id");
      logger.f(r);

      return ApiResponse<int>(r).parse(() => r.statusCode);
    } on DioException catch (e) {
      logger.w(e);
      if (e.response?.data != null) {
        return ApiResponse<int>(e.response).parse(() => e.response?.statusCode);
      } else {
        throw Exception("Response not found");
      }
    } catch (e) {
      logger.w(e);
      return ApiResponse<int>(null).error("/api/${XConfig.apiKey}/product/$id", errorMessage: e.toString());
    }
  }

  @override
  Future<Response<int?>> updateProducts(ProductModel? body) async {
    try {
      var r = await Api.call.put("/api/${XConfig.apiKey}/product/${body?.id}", data: body?.toJson());
      logger.f(r);

      return ApiResponse<int>(r).parse(() => r.statusCode);
    } on DioException catch (e) {
      logger.w(e);
      if (e.response?.data != null) {
        return ApiResponse<int>(e.response).parse(() => e.response?.statusCode);
      } else {
        throw Exception("Response not found");
      }
    } catch (e) {
      logger.w(e);
      return ApiResponse<int>(null).error("/api/${XConfig.apiKey}/product/${body?.id}", errorMessage: e.toString());
    }
  }
}
