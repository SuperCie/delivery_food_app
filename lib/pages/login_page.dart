import 'package:delivery_food/components/mybutton.dart';
import 'package:delivery_food/components/myfield.dart';
import 'package:delivery_food/models/displaymessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  void Function()? ontap;
  LoginPage({super.key, required this.ontap});

  //controller
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  // login
  void login(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: pwController.text);
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageUser(e.code, context);
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // design
              Lottie.asset('assets/animation/animation_logo.json',
                  height: 300, width: 350),
              //text
              const Text(
                'Online Foodies',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              // Field User and password Register
              Myfield(
                  controller: emailController,
                  obscuretext: false,
                  text: 'Email'),
              Myfield(
                  controller: pwController,
                  obscuretext: true,
                  text: 'Password'),

              // Register button
              Mybutton(
                text: 'Login',
                ontap: () => login(context),
              ),
              const SizedBox(
                height: 10,
              ),
              // change to Register page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Dont have an account? '),
                  GestureDetector(
                      onTap: ontap,
                      child: const Text(
                        'Register Here',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
