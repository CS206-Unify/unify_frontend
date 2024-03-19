import 'package:flutter/material.dart';

class CommonDetailsHeading extends StatelessWidget {
  const CommonDetailsHeading({super.key, this.type, required this.text});

  final String? type;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.titleSmall!.apply(
            color: type == "team"
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary));
  }
}
