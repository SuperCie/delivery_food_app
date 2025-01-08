import 'package:delivery_food/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Myreceipt extends StatelessWidget {
  const Myreceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 25),
      child: Center(
        child: Column(
          children: [
            const Text('Thank you for the order!'),
            const SizedBox(
              height: 25,
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary),
                    borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(12),
                child: Consumer<Restaurant>(
                  builder: (context, restaurant, child) =>
                      Text(restaurant.displayReceipt()),
                )),
          ],
        ),
      ),
    );
  }
}
