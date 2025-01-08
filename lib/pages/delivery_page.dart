import 'package:delivery_food/components/myreceipt.dart';
import 'package:delivery_food/models/restaurant.dart';
import 'package:delivery_food/service/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  // get access to db
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();

    //if we get to this page, submit order to firestore db
    String receipt = context.read<Restaurant>().displayReceipt();
    db.saveOrdertoDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Myreceipt(),
            SizedBox(
              height: 25,
            ),
            Text('Estimated delivery time is 4:10 PM'),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
      bottomNavigationBar: _buildNavigationWidget(context),
    );
  }
}

Widget _buildNavigationWidget(BuildContext context) {
  return Container(
    height: 100,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    ),
    padding: const EdgeInsets.all(25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle),
              child:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(
                  'Agus',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  'Driver',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ],
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle),
              child:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.message)),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.call,
                    color: Colors.green,
                  )),
            ),
          ],
        )
      ],
    ),
  );
}
