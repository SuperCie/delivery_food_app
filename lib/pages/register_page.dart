import 'package:delivery_food/components/mybutton.dart';
import 'package:delivery_food/components/myfield.dart';
import 'package:delivery_food/models/displaymessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  void Function()? ontap;
  RegisterPage({super.key, required this.ontap});

  //controller
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController cpController = TextEditingController();

  // register
  void register(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    if (pwController.text != cpController.text) {
      Navigator.pop(context);
      displayMessageUser("Password doesnt match!", context);
    } else {
      try {
        // ignore: unused_local_variable
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: pwController.text);
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        displayMessageUser(e.code, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // icon
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
              Myfield(
                  controller: cpController,
                  obscuretext: true,
                  text: 'Confirm Password'),

              // Register button
              Mybutton(
                text: 'Register',
                ontap: () => register(context),
              ),
              const SizedBox(
                height: 10,
              ),
              // change to login page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? '),
                  GestureDetector(
                      onTap: ontap,
                      child: const Text(
                        'Login Here',
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
