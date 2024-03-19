import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unify/utils/local_storage/secure_storage.dart';
import 'package:unify/widgets/home/team_stats.dart';
import 'package:http/http.dart' as http;
import 'package:unify/utils/constants/unify_backend.dart' as unify_client;

class TeamDetails extends StatefulWidget {

  final String id;
  final String region;
  final List<int> teamStats;


  TeamDetails({Key? key,required this.id, required this.region, required this.teamStats}) : super(key: key);

  @override
  State<TeamDetails> createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamDetails> {

  late Future<Map<String, dynamic>> teamDetailsFuture;
  
  @override
  void initState() {
    super.initState();
    teamDetailsFuture = getTeamDetails(widget.id);
  }

  Future<Map<String, dynamic>> getTeamDetails(String id) async {
    final result = await http.get(
        Uri.parse('${unify_client.unifyTeamServiceUrl}/$id'),
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: teamDetailsFuture,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
              Map<String, dynamic>? data = snapshot.data;
              Map<String, dynamic> team = data?['bsTeam'];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        style: Theme.of(context).textTheme.titleSmall?.apply(color: Theme.of(context).colorScheme.onSecondaryContainer),
                        "${team['teamName']}",
                      ),
                      Text(
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        " • ${widget.region}",
                      ),
                    ],
                  ), //team name + AP
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        foregroundImage: AssetImage('assets/images/logos/${team['imageString'] ?? "Unify.png"}'),
                        radius: 24.0,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.group_outlined,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 25.0,
                            weight: 0.5,
                          ),
                          Text(
                            style: Theme.of(context).textTheme.bodySmall?.apply(color: Theme.of(context).colorScheme.secondary),
                            '${team['memberList'].length}/${team['maximumTeamSize']}',
                          ),
                        ],
                      ),
                    ],
                  ), //team logo + num of team members
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    style: Theme.of(context).textTheme.labelSmall?.apply(color: Theme.of(context).colorScheme.onSecondaryContainer),
                    "Recruiting",
                  ), //"Recruiting"
                  const SizedBox(
                    height: 4.0,
                  ),
                  TeamStats(trophies: widget.teamStats.elementAt(0), wins3v3: widget.teamStats.elementAt(1), duoWins: widget.teamStats.elementAt(2), soloWins: widget.teamStats.elementAt(3)),
                ],
              );
            } else {
              return const Text('No teams to display :(');
            }
          default:
            return const Text('Unexpected Error');
        }
      },
    );
  }
}