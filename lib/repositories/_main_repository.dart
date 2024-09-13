/*
 * @Author: christyastama
 * @Date: 13/09/24 at 13.04
 */

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiResponse<T> {
  final Response? _response;
  late T? _data;
  ApiResponse(this._response);

  // Try to parse data from json object into model
  Response<T> parse(Function method) {
    try {
      _data = method();
    } catch (e) {
      debugPrint('error to parse original $e');
    }
    return Response<T>(
        requestOptions: _response!.requestOptions,
        statusMessage: _response!.statusMessage,
        statusCode: _response!.statusCode,
        extra: _response!.extra,
        headers: _response!.headers,
        isRedirect: _response!.isRedirect,
        redirects: _response!.redirects,
        data: _data
    );
  }

  // Error response from [Api]
  Response<T> error(String path, {String errorMessage = "Unknown error"}) {
    return Response<T>(
        requestOptions: RequestOptions(path: path),
        statusCode: 900,
        statusMessage: !kDebugMode ? "Unknown error" : errorMessage
    );
  }

  // Simple response mocked from [Api]
  Response<T> mock(Function method, {int statusCode = 200}) {
    try {
      _data = method();
    } catch (e) {
      debugPrint("Error to parse : ${e.toString()}");
    }
    return Response<T>(
        requestOptions: RequestOptions(path: "mock"),
        statusCode: statusCode,
        data: _data
    );
  }
}