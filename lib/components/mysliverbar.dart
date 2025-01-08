import 'package:delivery_food/pages/cart_page.dart';
import 'package:flutter/material.dart';

class Mysliverbar extends StatelessWidget {
  final Widget? child;
  final Widget? title;
  const Mysliverbar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        //cart button
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()));
            },
            icon: const Icon(Icons.shopping_cart))
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: const Text("Sunset Food"),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        title: title,
        centerTitle: true,
      ),
    );
  }
}
