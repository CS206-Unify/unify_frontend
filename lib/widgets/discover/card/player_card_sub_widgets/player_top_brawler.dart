import 'package:flutter/material.dart';
import 'package:unify/utils/formatter/brawler_formatter.dart';

class PlayerTopBrawler extends StatelessWidget {
  const PlayerTopBrawler(
      {super.key, required this.brawler, required this.rank});
  final String brawler;
  final int rank;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(-2, -2),
      children: [
        SizedBox(
          width: 56,
          height: 56,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image(
                image: AssetImage(
                    "assets/images/brawlstars/brawler_icons/${brawlerBackendToAssetImageStr(brawler)}")),
          ),
        ),
        Image(
          image: AssetImage(
              "assets/images/brawlstars/rank_plates/Rank_$rank.webp"),
        )
      ],
    );
  }
}
