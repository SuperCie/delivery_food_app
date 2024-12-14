import 'package:delivery_food/pages/login_page.dart';
import 'package:delivery_food/pages/register_page.dart';
import 'package:flutter/material.dart';

class Loginregist extends StatefulWidget {
  const Loginregist({super.key});

  @override
  State<Loginregist> createState() => _LoginregistState();
}

class _LoginregistState extends State<Loginregist> {
  bool showLoginPage = true;

  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        ontap: togglePage,
      );
    } else {
      return RegisterPage(
        ontap: togglePage,
      );
    }
  }
}
