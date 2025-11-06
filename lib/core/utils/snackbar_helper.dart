import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/routes_manager/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SnackbarHelper {
  static showSuccessSnackbar({required String message}) =>
      _showSnackbar(message: message, icon: Icons.check, bgColor: Colors.green);
  static showErrorSnackbar({required String message}) => _showSnackbar(
      message: message, icon: Icons.error_outline, bgColor: Colors.red);
  static _showSnackbar(
      {required String message,
      required IconData icon,
      required Color bgColor}) {
    if (navigatorKey.currentContext == null) return;
    SnackBar snackBar = SnackBar(
        backgroundColor: bgColor,
        content: Row(
          spacing: 20,
          children: [
            Icon(
              icon,
              size: 25,
              color: Colors.white,
            ),
            Text(
              message,
              style: getMediumStyle(color: Colors.white),
            ),
          ],
        ));

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
  }
}
