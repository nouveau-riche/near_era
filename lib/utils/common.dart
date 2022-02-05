import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:near_era/utils/const_color.dart';

printLog(dynamic value) {
  if (kDebugMode) {
    print("--------- App logs ---------\n$value");
  }
}

Future<bool?> toast(String message) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    fontSize: 15.0,
  );
}

showSnackbar(String message, [int timeInSec = 3]) {
  // Get.showSnackbar(GetSnackBar(
  //   message: message,
  //   duration: Duration(seconds: timeInSec),
  //   snackStyle: SnackStyle.FLOATING,
  // ));
}