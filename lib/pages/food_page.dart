import 'package:delivery_food/components/mybutton.dart';
import 'package:delivery_food/main.dart';
import 'package:delivery_food/models/food.dart';
import 'package:delivery_food/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  FoodPage({super.key, required this.food}) {
    //initiallize selected addons to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    // close the current food page
    Navigator.pop(context);

    // format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    // add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // UI
      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //food image
              Image.asset(
                widget.food.imagePath,
                height: 350,
                width: 500,
                fit: BoxFit.fill,
              ),
              //food text
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.food.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${widget.food.price.toString()}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.food.description,
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.secondary,
                      endIndent: 25,
                      indent: 25,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Add-ons',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.secondary)),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.food.availableAddons.length,
                        itemBuilder: (context, index) {
                          // get individual addons data
                          Addon addon = widget.food.availableAddons[index];
                          return CheckboxListTile(
                            title: Text(addon.name),
                            subtitle: Text(
                              '\$${addon.price.toString()}',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            value: widget.selectedAddons[addon],
                            onChanged: (bool? value) {
                              setState(() {
                                widget.selectedAddons[addon] = value!;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Mybutton(
                      text: 'Add to cart',
                      ontap: () =>
                          addToCart(widget.food, widget.selectedAddons),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // Back button
      SafeArea(
        child: Opacity(
          opacity: 0.3,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded),
            ),
          ),
        ),
      )
    ]);
  }
}
