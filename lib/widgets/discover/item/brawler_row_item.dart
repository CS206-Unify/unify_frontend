import 'package:flutter/material.dart';
import 'package:unify/data/unify-spring/serializers/discover/brawler_details_serializer.dart';
import 'package:unify/utils/formatter/brawler_formatter.dart';
import 'package:unify/utils/formatter/number_formatter.dart';

class BrawlerRowItem extends StatelessWidget {
  const BrawlerRowItem({super.key, required this.brawler});

  final BrawlerDetails brawler;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        spacing: 32,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          SizedBox(
            width: 56,
            height: 56,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                  image: AssetImage(
                      "assets/images/brawlstars/brawler_icons/${brawlerBackendToAssetImageStr(brawler.name)}")),
            ),
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            children: [
              Image(
                  image: AssetImage(
                      "assets/images/brawlstars/rank_plates/Rank_${brawler.rank}.webp")),
              Text(
                "${thousandFormatter(brawler.trophies)} Trophies",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .apply(color: Theme.of(context).colorScheme.primary),
              )
            ],
          )
        ],
      ),
    );
  }
}
