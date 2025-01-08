import 'package:delivery_food/components/myquantitycart.dart';
import 'package:delivery_food/models/cart_item.dart';
import 'package:delivery_food/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cartfoodtile extends StatelessWidget {
  final CartItem cartItem;
  const Cartfoodtile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => SafeArea(
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  //food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 80,
                      width: 80,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // name and price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.food.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text('\$${cartItem.food.price}')
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  //increment or decrement quantity
                  Myquantitycart(
                    quantity: cartItem.quantity,
                    food: cartItem.food,
                    onDecrement: () {
                      restaurant.removeCartItem(cartItem);
                    },
                    onIncrement: () {
                      restaurant.addToCart(
                          cartItem.food, cartItem.selectedAddons);
                    },
                  ),
                ],
              ),
              // addons
              SizedBox(
                height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: cartItem.selectedAddons
                      .map((addon) => Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: FilterChip(
                              label: Row(
                                children: [
                                  // addon name
                                  Text(addon.name),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  // addon price
                                  Text('\$${addon.price}'),
                                ],
                              ),
                              shape: StadiumBorder(
                                  side: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary)),
                              onSelected: (value) {},
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              labelStyle: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  fontSize: 12),
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
