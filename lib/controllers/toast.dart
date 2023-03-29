import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toastify {
  var successColor = Colors.green;
  var errorColor = Colors.deepOrange;
  var warnColor = Colors.yellow;

  mainToast(msg, color) {
    Fluttertoast.showToast(
        msg: msg,
        //textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 13.0);
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
