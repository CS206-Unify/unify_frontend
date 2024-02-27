import 'package:flutter/material.dart';
import 'package:unify/widgets/common/card/recommendation_card.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';
import 'package:unify/widgets/common/card/select_game_card.dart';
import 'package:unify/widgets/home/player_details.dart';
import 'package:unify/widgets/home/team_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(
              "Unify And Play Together",
              style: Theme.of(context).textTheme.titleMedium?.apply(color: Theme.of(context).colorScheme.tertiary),
            )),
            Container(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: <Widget>[
                  SelectGameCard(url: 'CODM.webp'),
                  SelectGameCard(url: 'BS.png'),
                  SelectGameCard(url: 'MLBB.jpg'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
              child: Text(
              "Player Recommendation",
              style: Theme.of(context).textTheme.titleMedium?.apply(color: Theme.of(context).colorScheme.primary),
              textAlign: TextAlign.left,
            )),
            Container(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: <Widget>[
                  RecommendationCard(display: PlayerDetails(region: 'Singapore', trophies: '114,918', name: 'Benjamin Gan', avatarUrl: 'BenjaminGan.png',)),
                  RecommendationCard(display: PlayerDetails(region: 'Singapore', trophies: '239,820', name: 'XXX', avatarUrl: 'BenjaminGan.png',)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
              child: Text(
              "Team Recommendation",
              style: Theme.of(context).textTheme.titleMedium?.apply(color: Theme.of(context).colorScheme.secondary),
              textAlign: TextAlign.left,
            )),
            Container(
              height: 190,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: <Widget>[
                  RecommendationCard(display: TeamDetails(teamName: 'Team Ninja', logoUrl: 'Unify.png', numMembers: 5, teamStats: [80,15,200,200],)),
                  RecommendationCard(display: TeamDetails(teamName: 'Team Hornets', logoUrl: 'CODM.webp', numMembers: 8, teamStats: [40,20,180,90],)),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(current: "home"),
    );
  }
}