import 'package:flutter/material.dart';
import 'package:unify/data/unify-spring/serializers/discover/brawler_details_serializer.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';
import 'package:unify/widgets/discover/card/player_details_hero_banner.dart';
import 'package:unify/widgets/discover/section/player_details_battle_history_section.dart';
import 'package:unify/widgets/discover/section/player_details_bio_section.dart';
import 'package:unify/widgets/discover/section/player_details_brawlers_section.dart';
import 'package:unify/widgets/discover/section/player_details_statistics_section.dart';

class PlayerDetailsPage extends StatefulWidget {
  const PlayerDetailsPage({super.key});

  @override
  State<PlayerDetailsPage> createState() => _PlayerDetailsPageState();
}

class _PlayerDetailsPageState extends State<PlayerDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(game: "bs", title: "Player Details"),
      body: Column(children: [
        const PlayerDetailsHeroBanner(
            region: "AP",
            username: "Benjamin Gan",
            trophies: 114918,
            joinDate: "January 20, 2024"),
        Expanded(
          child: Container(
            margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
            child: SingleChildScrollView(
              child: Wrap(
                direction: Axis.vertical,
                spacing: 24,
                children: [
                  PlayerDetailsStatisticsSection(
                      trophies: 114918,
                      soloWins: 776,
                      wins2v2: 1051,
                      wins3v3: 50212),
                  PlayerDetailsBioSection(
                      bio:
                          "I love Brawl Stars. I really really really really really really really really really really really really really really really really really really like it "),
                  PlayerDetailsBattleHistorySection(
                      wins: 86, loses: 13, draws: 1),
                  PlayerDetailsBrawlersSection(brawlers: [
                    BrawlerDetails(name: "SHELLY", rank: 22, trophies: 500),
                    BrawlerDetails(name: "SHELLY", rank: 22, trophies: 500),
                    BrawlerDetails(name: "SHELLY", rank: 22, trophies: 500),
                    BrawlerDetails(name: "SHELLY", rank: 22, trophies: 500),
                    BrawlerDetails(name: "SHELLY", rank: 22, trophies: 500),
                    BrawlerDetails(name: "SHELLY", rank: 22, trophies: 500),
                    BrawlerDetails(name: "SHELLY", rank: 22, trophies: 500),
                    BrawlerDetails(name: "SHELLY", rank: 22, trophies: 500)
                  ])
                ],
              ),
            ),
          ),
        )
      ]),
      bottomNavigationBar: const BottomNavBar(
        current: "discover",
      ),
    );
  }
}
