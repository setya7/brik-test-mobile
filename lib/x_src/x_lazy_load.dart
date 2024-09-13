/*
 * @Author: christyastama
 * @Date: 13/09/24 at 20.49
 */

import 'package:flutter/material.dart';

class LazyLoad {
  late ScrollController controller;

  void onListener({required Function onLoadMore, Function? addListener}) {
    controller = ScrollController();
    controller.addListener(() {
      if (controller.offset >= controller.position.maxScrollExtent &&
          !controller.position.outOfRange) {
        onLoadMore();
      }
      if (addListener != null) {
        addListener();
      }
    });
  }
}
