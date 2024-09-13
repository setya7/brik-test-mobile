/*
 * @Author: christyastama
 * @Date: 12/09/24 at 20.50
 */

/// Make singleton class
import 'package:briktestklontong21/x_src/x_config.dart';
import 'package:dio/dio.dart';

Dio? _call;

class Api {
  final bool _isMultipart = false;
  bool _isMock = false;
  static const String _baseUrl = XConfig.baseUrl;
  static const String urlToCall = _baseUrl;


  /// call this method only on your test case
  void mockInit() {
    _isMock = true;
  }

  /// Start Instantiating with static method
  /// [forceInstance] to forcing generate new instance
  static Future<bool> instantiation({bool forceInstance = false}) async => await Api().init(forceInstance: forceInstance);

  /// Init to Instantiating. <br/>
  /// set all base [Header]. <br/>
  /// set all base <br/>
  /// [forceInstance] to forcing generate new instance
  Future<bool> init({bool forceInstance = false}) async {
    if (_call != null && !forceInstance) return true;
    _call = Dio();

    _call!.options.baseUrl = urlToCall;
    _call!.options.headers['content-type'] = "application/json";
    if (!_isMultipart) {
      _call!.options.headers['Accept'] = "application/json";
      _call!.options.headers['accept'] = "application/json";
    }

    if (!_isMock) {
      _call!.options.headers['Authorization'] = "Bearer get from local storage";
    }
    return true;
  }

  /// Getter call
  static Dio get call => _call!;
}
