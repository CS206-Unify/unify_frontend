import 'package:flutter/material.dart';

class AppIconLarge extends StatelessWidget {
  const AppIconLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(100.0),
            border: Border.all(
                color: Theme.of(context).colorScheme.onPrimary, width: 1.0)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child:
              const Image(image: AssetImage("assets/images/logos/Unify.png")),
        ),
      ),
    );
  }
}
