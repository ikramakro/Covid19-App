import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {
  static fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static flushBar(BuildContext context, String message) {
    Flushbar(
      title: "Hey Ninja",
      titleColor: Colors.white,
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.red,
      boxShadows: const [
        BoxShadow(color: Colors.blue, offset: Offset(0.0, 2.0), blurRadius: 3.0)
      ],
      backgroundGradient:
          const LinearGradient(colors: [Colors.blueGrey, Colors.black]),
      isDismissible: false,
      duration: const Duration(seconds: 4),
      icon: const Icon(
        Icons.check,
        color: Colors.greenAccent,
      ),
    ).show(context);
  }
}
