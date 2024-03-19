import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:unify/utils/local_storage/secure_storage.dart';
import 'package:unify/widgets/common/card/recommendation_card.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';
import 'package:unify/widgets/common/card/select_game_card.dart';
import 'package:unify/widgets/home/player_details.dart';
import 'package:unify/widgets/home/team_details.dart';
import 'package:http/http.dart' as http;
import 'package:unify/utils/constants/unify_backend.dart' as unify_client;

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Map<String, dynamic>> getUserDetails() async {
    final result = await http.get(
        Uri.parse(unify_client.unifyProfileServiceUrl),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${await SecureStorage.getToken()}",
          HttpHeaders.contentTypeHeader: "application/json",
        },);

    if (result.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(result.body);
      return body;
    } else {
      throw Exception('Failed to load user details: ${result.statusCode}');
    }
  }
  
  Future<Map<String, dynamic>> getPlayerRecommendations() async {

    final userDetails = await getUserDetails();

    final region = userDetails['user']['region'] ?? "AP";
    final language = userDetails['user']['language'] ?? "English";
    final trophies = userDetails['user']['bsProfile']['trophies'] ?? "0";
    final threeVThreeWins = userDetails['user']['bsProfile']['threeVsThreeVictories'] ?? "0";
    final twoVTwoWins = userDetails['user']['bsProfile']['duoVictories'] ?? "0";
    final soloWins = userDetails['user']['bsProfile']['soloVictories'] ?? "0";

    final result = await http.get(
        Uri.parse('${unify_client.unifyDiscoverServiceUrl}/profile?region=$region&language=$language&trophies=$trophies&threeVThreeWins=$threeVThreeWins&twoVTwoWins=$twoVTwoWins&soloWins=$soloWins&pageSize=1&pageNumber=0'),
        // Uri.parse('${unify_client.unifyDiscoverServiceUrl}/profile?region=AP&language=English&trophies=30000&threeVThreeWins=9000&twoVTwoWins=1095&soloWins=900&pageSize=1&pageNumber=0'),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${await SecureStorage.getToken()}",
          HttpHeaders.contentTypeHeader: "application/json",
        },);

    if (result.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(result.body);
      return body;
    } else {
      throw Exception('Failed to load user details: ${result.statusCode}');
    }
  }

  Future<Map<String, dynamic>> getTeamRecommendations() async {

    final userDetails = await getUserDetails();

    final region = userDetails['user']['region'] ?? "AP";
    final language = userDetails['user']['language'] ?? "English";
    final trophies = userDetails['user']['bsProfile']['trophies'] ?? "0";
    final threeVThreeWins = userDetails['user']['bsProfile']['threeVsThreeVictories'] ?? "0";
    final twoVTwoWins = userDetails['user']['bsProfile']['duoVictories'] ?? "0";
    final soloWins = userDetails['user']['bsProfile']['soloVictories'] ?? "0";

    final result = await http.get(
        Uri.parse('${unify_client.unifyDiscoverServiceUrl}/team?region=$region&language=$language&trophies=$trophies&threeVThreeWins=$threeVThreeWins&twoVTwoWins=$twoVTwoWins&soloWins=$soloWins&pageSize=3&pageNumber=0'),
        // Uri.parse('${unify_client.unifyDiscoverServiceUrl}/team?region=EU&trophies=30000&threeVThreeWins=9000&twoVTwoWins=1095&soloWins=900&pageSize=3&pageNumber=0'),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${await SecureStorage.getToken()}",
          HttpHeaders.contentTypeHeader: "application/json",
        },);

    if (result.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(result.body);
      return body;
    } else {
      throw Exception('Failed to load user details: ${result.statusCode}');
    }
  }

  late Future<Map<String, dynamic>> playerRecommendationsFuture;
  late Future<Map<String, dynamic>> teamRecommendationsFuture;

  @override
  void initState() {
    super.initState();
    playerRecommendationsFuture = getPlayerRecommendations();
    teamRecommendationsFuture = getTeamRecommendations();
  }

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
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
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
              padding: const EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
              child: Text(
              "Player Recommendation",
              style: Theme.of(context).textTheme.titleMedium?.apply(color: Theme.of(context).colorScheme.primary),
              textAlign: TextAlign.left,
            )),
            Container(
              height: 170,
              child: FutureBuilder<Map<String, dynamic>?>(
                future: playerRecommendationsFuture,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      } else if (snapshot.hasData) {
                        Map<String, dynamic>? data = snapshot.data;
                        
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: data?['bsProfileListingList'].length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> player = data?['bsProfileListingList'][index];
                            return RecommendationCard(route: '/player_details/:${player['_id']}', display: PlayerDetails(region: player['region'], trophies: player['trophies'].toString(), name: player['username'], avatarUrl: 'BenjaminGan.png',));
                          },
                        );
                      } else {
                        return const Text('No teams to display :(');
                      }
                    default:
                      return const Text('Unexpected Error');
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
              child: Text(
              "Team Recommendation",
              style: Theme.of(context).textTheme.titleMedium?.apply(color: Theme.of(context).colorScheme.secondary),
              textAlign: TextAlign.left,
            )),
            Container(
              height: 190,
              child: FutureBuilder<Map<String, dynamic>?>(
                future: teamRecommendationsFuture,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      } else if (snapshot.hasData) {
                        Map<String, dynamic>? data = snapshot.data;
                        // print(data);
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: data?['bsTeamListings'].length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> team = data?['bsTeamListings'][index];
                            final String region = team['region'] ?? "Any";
                            final String teamTrophies = team['trophies'] ?? "0";
                            final String team3v3Wins = team['threeVThreeWins'] ?? "0";
                            final String team2v2Wins = team['twoVTwoWinds'] ?? "0";
                            final String teamSoloWins = team['soloWins'] ?? "0";
                            return RecommendationCard(route: '/team_details/:${team['_id']}', display: TeamDetails(id: team['_id'], region: region, teamStats: [int.parse(teamTrophies), int.parse(team3v3Wins), int.parse(team2v2Wins), int.parse(teamSoloWins)]));
                          },
                        );
                      } else {
                        return const Text('No teams to display :(');
                      }
                    default:
                      return const Text('Unexpected Error');
                  }
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(current: "home"),
    );
  }
}