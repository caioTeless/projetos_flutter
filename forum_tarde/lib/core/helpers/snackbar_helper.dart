import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class SnackBarHelper {
  const SnackBarHelper._();

  static void showFailureMessage(
    BuildContext context, {
    required String message,
    int duration = 3,
    bool blockBackgroundInteraction = true,
  }) {
    Flushbar(
      message: message,
      padding: const EdgeInsets.all(20.0),
      blockBackgroundInteraction: blockBackgroundInteraction,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(8),
      icon: const Icon(
        Icons.cancel,
        size: 28.0,
        color: Colors.red,
      ),
    ).show(context);
  }

  static void showSuccessMessage(
    BuildContext context, {
    required String message,
    int duration = 3,
    bool blockBackgroundInteraction = true,
  }) {
    Flushbar(
      message: message,
      padding: const EdgeInsets.all(20.0),
      blockBackgroundInteraction: true,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(8),
      icon: const Icon(
        Icons.check_circle,
        size: 28.0,
        color: Colors.green,
      ),
    ).show(context);
  }
}
