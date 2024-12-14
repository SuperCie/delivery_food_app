import 'package:flutter/material.dart';

class Mysliverbar extends StatelessWidget {
  final Widget? child;
  final Widget? title;
  const Mysliverbar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: title,
      flexibleSpace: FlexibleSpaceBar(
        background: child,
      ),
    );
  }
}
