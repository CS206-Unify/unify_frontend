import 'package:flutter/material.dart';
import 'package:unify/utils/formatter/number_formatter.dart';

class PlayerTrophies extends StatelessWidget {
  const PlayerTrophies({super.key, required this.trophies});

  final int trophies;

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
              image: AssetImage("assets/images/brawlstars/misc/Trophy.png"),
            )),
        Text(
          "${thousandFormatter(trophies)} Trophies",
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .apply(color: Theme.of(context).colorScheme.secondary),
        )
      ],
    );
  }
}
