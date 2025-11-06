import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/routes_manager/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DialogHelper {
  static showLoadingDialog() =>
      _showDialog(CircularProgressIndicator(), isDismissible: false);
  static showSuccessDialog({String? message}) => _showDialog(
      Icon(
        Icons.check_circle_outline_rounded,
        size: 50,
        color: Colors.green,
      ),
      message: message);
  static showErrorDialog({String? message}) => _showDialog(
      Icon(
        Icons.error_outline,
        size: 50,
        color: Colors.red,
      ),
      message: message);
  static _showDialog(Widget child,
      {String? message, bool isDismissible = true}) {
    if (navigatorKey.currentContext == null) return;
    showDialog(
        barrierDismissible: isDismissible,
        context: navigatorKey.currentContext!,
        builder: (context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: <Widget>[
                    child,
                    if (message != null)
                      Text(
                        message,
                        style: getMediumStyle(color: Colors.black),
                      )
                  ],
                ),
              ),
            ));
  }
}
