import 'package:delivery_food/components/cartfoodtile.dart';
import 'package:delivery_food/components/mybutton.dart';
import 'package:delivery_food/models/restaurant.dart';
import 'package:delivery_food/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        // get user cart
        final userCart = restaurant.cart;
        // UI
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Cart'),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title:
                            const Text('Are you sure want to clear the cart?'),
                        actions: [
                          MaterialButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                              restaurant.clearCart();
                            },
                            child: const Text('Yes'),
                          )
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
          body: Column(
            children: [
              //list of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                            child: Text('Cart is empty..'),
                          ))
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                //get individual cart item
                                final cartItem = userCart[index];
                                // ui
                                return Cartfoodtile(cartItem: cartItem);
                              },
                            ),
                          ),
                  ],
                ),
              ),
              // checkout button
              Mybutton(
                text: 'Checkout',
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentPage(),
                      ));
                },
              )
            ],
          ),
        );
      },
    );
  }
}
