import 'package:flutter/material.dart';
import 'package:unify/data/unify-spring/serializers/discover/battle_history_serializer.dart';
import 'package:unify/widgets/discover/heading/common_details_heading.dart';
import 'package:unify/widgets/discover/text/player_details_battle_history_text.dart';

class PlayerDetailsBattleHistorySection extends StatelessWidget {
  const PlayerDetailsBattleHistorySection({super.key, required this.history});

  final BattleHistory history;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 8,
          direction: Axis.vertical,
          children: [
            const CommonDetailsHeading(
                text: "Battle History (Last 100 Battles)"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlayerDetailsBattleHistoryText(
                    type: "Wins", count: history.wins),
                PlayerDetailsBattleHistoryText(
                    type: "Loses", count: history.loses),
                PlayerDetailsBattleHistoryText(
                    type: "Draws", count: history.draws),
              ],
            )
          ],
        ));
  }
}
