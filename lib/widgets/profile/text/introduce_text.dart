import 'package:flutter/material.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      alignment: Alignment.topCenter,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.apply(color: Theme.of(context).colorScheme.onPrimaryContainer),
      ),
    );
  }
}
