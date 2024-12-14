import 'package:delivery_food/components/mytile.dart';
import 'package:delivery_food/pages/home_page.dart';
import 'package:delivery_food/pages/setting_page.dart';
import 'package:delivery_food/theme/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  void logout(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'LOGOUT CONFIRMATION',
          textAlign: TextAlign.center,
        ),
        content: const Text('Are you sure want to logout the account?'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  BorderRadius.circular(12);
                },
                child: const Text('Cancel'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  FirebaseAuth.instance.signOut();
                  BorderRadius.circular(12);
                },
                child: const Text('Yes'),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                      dividerTheme:
                          const DividerThemeData(color: Colors.transparent)),
                  child: DrawerHeader(
                    child: Image.asset(
                      'assets/images/delivery_truck.png',
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                Mytile(
                  leading: const Icon(Icons.home),
                  text: 'H O M E',
                  ontap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                  },
                ),
                Mytile(
                  leading: const Icon(Icons.settings),
                  text: 'S E T T I N G',
                  ontap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingPage(),
                        ));
                  },
                ),
              ],
            ),
            Mytile(
              leading: const Icon(Icons.logout),
              text: 'L O G O U T',
              ontap: () => logout(context),
            ),
          ],
        ),
      ),
    );
  }
}
