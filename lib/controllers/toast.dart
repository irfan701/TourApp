import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toastify {
  var successColor = Colors.green;
  var errorColor = Colors.red;
  var warnColor = Colors.yellow;

  mainToast(msg, color) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        //textColor: Colors.white,
        fontSize: 16.0);
  }

  success(msg) {
    mainToast(msg, successColor);
  }

  error(msg) {
    mainToast(msg, errorColor);
  }

  warn(msg) {
    mainToast(msg, warnColor);
  }
}
