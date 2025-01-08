import 'package:delivery_food/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Mycurrentlocation extends StatelessWidget {
  Mycurrentlocation({super.key});

  final textController = TextEditingController();

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Your Location'),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: 'Enter address...'),
        ),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          //save button
          MaterialButton(
            onPressed: () {
              //update the data
              String newAddress = textController.text;
              context.read<Restaurant>().updateAddres(newAddress);
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver Now',
            style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //address
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) =>
                      Text(restaurant.deliveryAddress),
                ),
                // drop down menu
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
