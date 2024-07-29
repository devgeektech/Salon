
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void successSnackBar(
    BuildContext context,
    String message, {
      String? actionLabel,
      VoidCallback? action, // Default color is green
    }) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor : Colors.green,
      action: actionLabel != null
          ? SnackBarAction(
        label: actionLabel,
        onPressed: action ?? () {},
        textColor: Colors.white, // Ensure action text is visible on green background
      )
          : null,
    ),
  );
}


void errorSnackBar(
    BuildContext context,
    String message, {
      String? actionLabel,
      VoidCallback? action, // Default color is green
    }) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor : Colors.red,
      action: actionLabel != null
          ? SnackBarAction(
        label: actionLabel,
        onPressed: action ?? () {},
        textColor: Colors.white, // Ensure action text is visible on green background
      )
          : null,
    ),
  );
}

