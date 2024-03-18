import 'package:flutter/material.dart';
import 'package:unify/widgets/discover/heading/common_details_heading.dart';
import 'package:unify/widgets/discover/text/player_details_statistics_item.dart';

class TeamRequirementStatistics extends StatelessWidget {
  const TeamRequirementStatistics(
      {super.key,
      required this.trophies,
      required this.soloWins,
      required this.wins2v2,
      required this.wins3v3});

  final int trophies;
  final int wins3v3;
  final int wins2v2;
  final int soloWins;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 24),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 8,
        direction: Axis.vertical,
        children: [
          const CommonDetailsHeading(text: "Statistics"),
          Wrap(
            spacing: 32,
            children: [
              Column(
                children: [
                  PlayerDetailsStatisticsItem(
                      display: "trophy", count: trophies),
                  PlayerDetailsStatisticsItem(display: "3v3", count: wins3v3)
                ],
              ),
              Column(
                children: [
                  PlayerDetailsStatisticsItem(display: "2v2", count: wins2v2),
                  PlayerDetailsStatisticsItem(display: "solo", count: soloWins)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
