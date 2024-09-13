/*
 * @Author: christyastama
 * @Date: 13/09/24 at 09.36
 */

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class Helper {
  ///just wording
  static String rupiahFormatForWording(dynamic value, {bool symbol = true}) {
    var currency = NumberFormat.currency(locale: "in_ID", symbol: symbol ? "Rp " : "");
    try {
      var result = '';
      if (value is! int) {
        int v = int.parse("$value");
        result = currency.format(v);
      } else {
        result = currency.format(value);
      }
      return result;
    } catch (e) {
      debugPrint("Error convert currency : ${e.toString()}");
      return "";
    }
  }

  static String rupiahFormat(dynamic value, {bool symbol = true}) {
    var currency = NumberFormat.currency(locale: "in_ID", symbol: symbol ? "Rp " : "");
    try {
      var result = '';
      if (value is! int) {
        int v = int.parse("$value");
        result = currency.format(v);
      } else {
        result = currency.format(value);
      }
      return result.replaceAll(",00", "");
    } catch (e) {
      debugPrint("Error convert currency : ${e.toString()}");
      return "";
    }
  }
}

var logger = Logger(printer: PrettyPrinter());

