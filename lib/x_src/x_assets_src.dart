/*
 * @Author: christyastama
 * @Date: 13/09/24 at 10.30
 */


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

/// Variable to serve singleton principle
_Assets? _assets;

const String _images = 'assets/images/';

class XR {
  /// Getter string resources
  static StringCtx string(BuildContext context) {
    return StringCtx(context);
  }

  /// Getter assets resources
  static _Assets get assets {
    _assets ??= _Assets();
    if (kDebugMode) _assets = _Assets();
    return _assets!;
  }
}

class _Assets {
  String defaultImg = '${_images}default-image.jpg';
}

class StringCtx {
  final BuildContext context;
  StringCtx(this.context);
}