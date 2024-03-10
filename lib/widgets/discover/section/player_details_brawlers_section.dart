import 'package:flutter/cupertino.dart';
import 'package:unify/data/unify-spring/serializers/discover/brawler_details_serializer.dart';
import 'package:unify/widgets/discover/heading/common_details_heading.dart';
import 'package:unify/widgets/discover/item/brawler_row_item.dart';

class PlayerDetailsBrawlersSection extends StatelessWidget {
  const PlayerDetailsBrawlersSection({super.key, required this.brawlers});

  final List<BrawlerDetails> brawlers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 20,
        direction: Axis.vertical,
        children: [
          const CommonDetailsHeading(text: "Brawlers"),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: brawlers.length,
                itemBuilder: (context, index) => Column(
                      children: [
                        BrawlerRowItem(brawler: brawlers[index]),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    )),
          )
        ],
      ),
    );
  }
}
