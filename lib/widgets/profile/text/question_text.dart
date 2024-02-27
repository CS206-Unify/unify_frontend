import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .labelSmall
          ?.apply(color: Theme.of(context).colorScheme.onPrimaryContainer),
    ));
  }
}
