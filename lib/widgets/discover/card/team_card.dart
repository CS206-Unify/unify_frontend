import 'package:flutter/material.dart';

import 'package:unify/router.dart';
import 'package:unify/widgets/discover/card/team_card_sub_widgets/team_banner.dart';
import 'package:unify/widgets/discover/card/team_card_sub_widgets/team_requirement_statistics.dart';
import 'package:unify/widgets/discover/screens/teamdetails_page.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({
    super.key,
    required this.id,
    this.imageUrl,
    required this.region,
    required this.teamName,
    required this.requiredTrophies,
    required this.wins3v3,
    required this.wins2v2,
    required this.soloWins,
    required this.currentTeamSize,
    required this.maximumTeamSize,
  });

  final String id;
  final String? imageUrl;
  final String teamName;
  final String region;
  final int requiredTrophies;
  final int wins3v3;
  final int wins2v2;
  final int soloWins;
  final int currentTeamSize;
  final int maximumTeamSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: InkWell(
        onTap: () {
          router.go("/team_details/$id");
        },
        child: Container(
          width: double.infinity,
          height: 185,
          color: const Color.fromRGBO(44, 41, 47, 1),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TeamBanner(
                    imageUrl: imageUrl,
                    teamName: teamName,
                    maximumTeamSize: maximumTeamSize,
                    currentTeamSize: currentTeamSize,
                  ),
                  Text(
                    region,
                    style: TextStyle(
                      color: Colors.grey,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                flex: 1,
                child: TeamRequirementStatistics(
                  trophies: requiredTrophies,
                  soloWins: soloWins,
                  wins2v2: wins2v2,
                  wins3v3: wins3v3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
