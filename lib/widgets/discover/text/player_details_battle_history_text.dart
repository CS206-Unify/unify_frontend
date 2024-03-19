import 'package:flutter/material.dart';

class PlayerDetailsBattleHistoryText extends StatelessWidget {
  const PlayerDetailsBattleHistoryText(
      {super.key, required this.type, required this.count});

  final String type;
  final int count;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .apply(color: Theme.of(context).colorScheme.inverseSurface),
            children: [
          TextSpan(text: "$type: "),
          TextSpan(
              text: "$count",
              style: Theme.of(context).textTheme.labelSmall!.apply(
                  color: type == "Wins"
                      ? Colors.green
                      : type == "Loses"
                          ? Colors.red
                          : Colors.blue))
        ]));
  }
}
