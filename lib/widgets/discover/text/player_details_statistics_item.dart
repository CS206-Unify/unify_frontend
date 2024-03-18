import 'package:flutter/material.dart';
import 'package:unify/utils/formatter/statistics_formatter.dart';

class PlayerDetailsStatisticsItem extends StatelessWidget {
  const PlayerDetailsStatisticsItem(
      {super.key, required this.display, required this.count});

  final String display;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 4,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Image(
              image: AssetImage(
                  "assets/images/brawlstars/misc/${display == "trophy" ? "Trophy.png" : display == "3v3" ? "3v3.webp" : display == "2v2" ? "Duo-Showdown.webp" : "Showdown.webp"}")),
        ),
        Text(
          statsFormatter(count, display),
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .apply(color: Theme.of(context).colorScheme.secondary),
        )
      ],
    );
  }
}
