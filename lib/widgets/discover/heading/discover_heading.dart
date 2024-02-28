import 'package:flutter/material.dart';

class DiscoverHeading extends StatelessWidget {
  const DiscoverHeading({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .apply(color: Theme.of(context).colorScheme.primary),
    );
  }
}
