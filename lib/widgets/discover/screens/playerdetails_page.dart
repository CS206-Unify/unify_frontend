import 'package:flutter/material.dart';
import 'package:unify/data/unify-spring/discover.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';
import 'package:unify/widgets/discover/card/player_details_hero_banner.dart';
import 'package:unify/widgets/discover/dialog/invite_to_team_dialog.dart';
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
      body: FutureBuilder(
          future: getProfileById(widget.userId),
          builder: (context, profileSnapshot) {
            if (profileSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (profileSnapshot.hasError) {
              return Text("Error: ${profileSnapshot.error}");
            } else {
              return Column(children: [
                PlayerDetailsHeroBanner(
                    region: profileSnapshot.data!.region,
                    username: profileSnapshot.data!.username,
                    trophies: profileSnapshot.data!.trophies,
                    joinDate: profileSnapshot.data!.joinDate),
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsetsDirectional.only(start: 16, end: 16),
                    child: SingleChildScrollView(
                      child: Wrap(
                        direction: Axis.vertical,
                        spacing: 24,
                        children: [
                          PlayerDetailsStatisticsSection(
                              trophies: profileSnapshot.data!.trophies,
                              soloWins: profileSnapshot.data!.winsSolo,
                              wins2v2: profileSnapshot.data!.wins2v2,
                              wins3v3: profileSnapshot.data!.wins3v3),
                          PlayerDetailsBioSection(
                              bio: profileSnapshot.data!.bio),
                          // FutureBuilder(
                          //   future: getBrawlStarHistory(
                          //       profileSnapshot.data!.playerTag),
                          //   builder: (context, battleHistorySnapshot) {
                          //     if (battleHistorySnapshot.connectionState ==
                          //         ConnectionState.waiting) {
                          //       return const Center(
                          //           child: CircularProgressIndicator());
                          //     } else if (battleHistorySnapshot.hasError) {
                          //       return Text(
                          //           "Error: ${battleHistorySnapshot.error}");
                          //     } else {
                          //       return PlayerDetailsBattleHistorySection(
                          //           history: battleHistorySnapshot.data!);
                          //     }
                          //   },
                          // ),
                          PlayerDetailsBrawlersSection(
                              brawlers: profileSnapshot.data!.brawlers)
                        ],
                      ),
                    ),
                  ),
                )
              ]);
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Wrap(
        spacing: 12,
        children: [
          const FilledButton(onPressed: null, child: Text("Chat")),
          FilledButton(
              onPressed: () {
                showDialog(
                    context: context,
                    useRootNavigator: false,
                    builder: ((context) => const InviteToTeamDialog()));
              },
              child: const Text("Invite to Team"))
        ],
      ),
      bottomNavigationBar: const BottomNavBar(
        current: "discover",
      ),
    );
  }
}
