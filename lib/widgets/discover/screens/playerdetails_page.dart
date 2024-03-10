import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/data/unify-spring/discover.dart';
import 'package:unify/model/discover/invite_to_team_model.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';
import 'package:unify/widgets/discover/card/player_details_hero_banner.dart';
import 'package:unify/widgets/discover/dialog/invite_to_team_dialog.dart';
import 'package:unify/widgets/discover/section/player_details_battle_history_section.dart';
import 'package:unify/widgets/discover/section/player_details_bio_section.dart';
import 'package:unify/widgets/discover/section/player_details_brawlers_section.dart';
import 'package:unify/widgets/discover/section/player_details_statistics_section.dart';

class PlayerDetailsPage extends StatefulWidget {
  const PlayerDetailsPage({
    super.key,
    required this.userId,
  });

  final String userId;

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
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return Column(children: [
                PlayerDetailsHeroBanner(
                    region: snapshot.data!.region,
                    username: snapshot.data!.username,
                    trophies: snapshot.data!.trophies,
                    joinDate: snapshot.data!.joinDate),
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
                              trophies: snapshot.data!.trophies,
                              soloWins: snapshot.data!.winsSolo,
                              wins2v2: snapshot.data!.wins2v2,
                              wins3v3: snapshot.data!.wins3v3),
                          PlayerDetailsBioSection(bio: snapshot.data!.bio),
                          PlayerDetailsBattleHistorySection(
                            wins: snapshot.data!.recentWins,
                            loses: snapshot.data!.recentLoses,
                            draws: snapshot.data!.recentDraws,
                          ),
                          PlayerDetailsBrawlersSection(
                              brawlers: snapshot.data!.brawlers)
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
                    builder: ((context) => ChangeNotifierProvider(
                          create: (context) => InviteToTeamModel(),
                          child: InviteToTeamDialog(userId: widget.userId),
                        )));
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
