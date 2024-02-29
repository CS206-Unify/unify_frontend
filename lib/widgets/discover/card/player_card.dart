import 'package:flutter/material.dart';
import 'package:unify/widgets/discover/card/player_card_sub_widgets/player_3v3.dart';
import 'package:unify/widgets/discover/card/player_card_sub_widgets/player_banner.dart';
import 'package:unify/widgets/discover/card/player_card_sub_widgets/player_region_text.dart';
import 'package:unify/widgets/discover/card/player_card_sub_widgets/player_top_brawler.dart';
import 'package:unify/widgets/discover/card/player_card_sub_widgets/player_trophies.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard(
      {super.key,
      this.imageUrl,
      this.region,
      required this.name,
      required this.trophies,
      required this.wins3v3,
      required this.brawler,
      required this.rank});

  final String? imageUrl;
  final String name;
  final String? region;
  final int trophies;
  final int wins3v3;
  final String brawler;
  final int rank;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: Container(
        width: double.infinity - 32,
        color: const Color.fromRGBO(44, 41, 47, 1),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              spacing: 8,
              direction: Axis.vertical,
              children: [
                PlayerBanner(
                  name: name,
                  imageUrl: imageUrl,
                ),
                PlayerTrophies(trophies: trophies),
                Player3v3(wins3v3: wins3v3)
              ],
            ),
            SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PlayerRegionText(region: region),
                  PlayerTopBrawler(brawler: brawler, rank: rank)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
