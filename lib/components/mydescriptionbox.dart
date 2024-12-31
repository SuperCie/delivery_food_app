import 'package:flutter/material.dart';

class Mydescriptionbox extends StatelessWidget {
  Mydescriptionbox({super.key});

  @override
  Widget build(BuildContext context) {
    var myPrimaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var mySecondaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.primary);

    return Container(
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //delivery fee
          Column(
            children: [
              Text(
                'Rp 32.500',
                style: myPrimaryTextStyle,
              ),
              Text(
                'Delivery Fee',
                style: mySecondaryTextStyle,
              ),
            ],
          ),
          //delivery time
          Column(
            children: [
              Text(
                '15-20 Minutes',
                style: myPrimaryTextStyle,
              ),
              Text(
                'Delivery Time',
                style: mySecondaryTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
