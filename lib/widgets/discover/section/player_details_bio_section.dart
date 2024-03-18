import 'package:flutter/material.dart';
import 'package:unify/widgets/discover/heading/common_details_heading.dart';

class PlayerDetailsBioSection extends StatelessWidget {
  const PlayerDetailsBioSection({super.key, required this.bio});

  final String bio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 8,
        direction: Axis.vertical,
        children: [
          const CommonDetailsHeading(text: "Bio"),
          SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            child: Text(
              bio,
              softWrap: true,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .apply(color: Theme.of(context).colorScheme.inverseSurface),
            ),
          )
        ],
      ),
    );
  }
}
