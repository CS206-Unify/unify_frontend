import 'package:flutter/material.dart';
import 'package:unify/utils/formatter/number_formatter.dart';

class Player3v3 extends StatelessWidget {
  const Player3v3({super.key, required this.wins3v3});

  final int wins3v3;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const SizedBox(
            width: 24,
            height: 24,
            child: Image(
              image: AssetImage("assets/images/brawlstars/misc/3v3.webp"),
            )),
        Text(
          "${thousandFormatter(wins3v3)} 3v3 Wins",
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .apply(color: Theme.of(context).colorScheme.secondary),
        )
      ],
    );
  }
}