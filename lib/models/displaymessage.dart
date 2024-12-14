import 'package:flutter/material.dart';

void displayMessageUser(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Text(message),
  );
}
