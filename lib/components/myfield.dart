import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Myfield extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final bool obscuretext;
  final String text;
  Myfield(
      {super.key,
      required this.controller,
      required this.obscuretext,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: TextField(
        controller: controller,
        obscureText: obscuretext,
        decoration: InputDecoration(
            hintText: text,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            fillColor: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
