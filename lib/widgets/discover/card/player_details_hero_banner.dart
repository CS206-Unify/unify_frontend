import 'package:flutter/material.dart';
import 'package:unify/widgets/discover/card/player_card_sub_widgets/player_region_text.dart';
import 'package:unify/widgets/discover/card/player_card_sub_widgets/player_trophies.dart';

class PlayerDetailsHeroBanner extends StatelessWidget {
  const PlayerDetailsHeroBanner(
      {super.key,
      this.profileImg,
      required this.region,
      required this.username,
      required this.trophies,
      required this.joinDate});

  final String? profileImg;
  final String region;
  final String username;
  final int trophies;
  final String joinDate;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.outlineVariant),
        child: Wrap(
          spacing: 12,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: profileImg == null || profileImg!.isEmpty
                      ? const Image(
                          image: AssetImage(
                              "assets/images/avatars/BenjaminGan.png"))
                      : Image.network(profileImg!)),
            ),
            Wrap(
              spacing: 8,
              direction: Axis.vertical,
              children: [
                PlayerRegionText(
                  region: region,
                ),
                Text(username,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .apply(color: Theme.of(context).colorScheme.primary)),
                PlayerTrophies(trophies: trophies),
                Text("Join Date: $joinDate",
                    style: Theme.of(context).textTheme.labelSmall!.apply(
                        color: Theme.of(context).colorScheme.inverseSurface))
              ],
            )
          ],
        ));
  }
}
