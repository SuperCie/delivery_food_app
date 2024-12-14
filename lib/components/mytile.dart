import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Mytile extends StatelessWidget {
  final Widget? leading;
  final String text;
  void Function()? ontap;
  Mytile(
      {super.key,
      required this.leading,
      required this.text,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(text),
      onTap: ontap,
    );
  }
}
