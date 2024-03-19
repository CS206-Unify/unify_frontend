import 'package:flutter/material.dart';

class PlayerRegionText extends StatelessWidget {
  const PlayerRegionText({super.key, this.region});
  final String? region;

  @override
  Widget build(BuildContext context) {
    return Text(
      region ?? "N/A",
      style: Theme.of(context)
          .textTheme
          .labelSmall!
          .apply(color: Theme.of(context).colorScheme.outline),
    );
  }
}
