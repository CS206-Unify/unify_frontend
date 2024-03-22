import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:unify/utils/local_storage/secure_storage.dart';
import 'package:unify/widgets/common/card/team_manage_card.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:unify/utils/constants/unify_backend.dart' as unify_client;

class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {

  Future<Map<String, dynamic>> getUserDetails() async {
    final result = await http.get(
        Uri.parse(unify_client.unifyProfileServiceUrl),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer ${await SecureStorage.getToken()}",
          HttpHeaders.contentTypeHeader: "application/json",
        },);

    if (result.statusCode == 200) {
      // Parse the response body
      final Map<String, dynamic> body = json.decode(result.body);
      return body;
    } else {
      // Handle HTTP error
      throw Exception('Failed to load user details: ${result.statusCode}');
    }
  }

  Future<List<Map<String, dynamic>>> fetchUserTeams(List<String> teamIds) async {
  List<Map<String, dynamic>> teams = [];
  
  for (String teamId in teamIds) {
    final teamResponse = await http.get(
      Uri.parse('${unify_client.unifyServerBaseUrl}/team/$teamId'), // Replace with your actual API endpoint
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${await SecureStorage.getToken()}",
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    
    if (teamResponse.statusCode == 200) {
      final Map<String, dynamic> teamData = json.decode(teamResponse.body);
      teams.add(teamData);
    } else {
      throw Exception('Failed to fetch team details: ${teamResponse.statusCode}');
    }
  }
  
  return teams;
}

  late Future<Map<String, dynamic>> userDetailsFuture;

  @override
  void initState() {
    super.initState();
    userDetailsFuture = getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(title: 'Mng. Teams/Scrims'),
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: FutureBuilder<Map<String, dynamic>?>(
              future: userDetailsFuture,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else if (snapshot.hasData) {
                      Map<String, dynamic>? data = snapshot.data;
                      // Access the 'user' field
                      final Map<String, dynamic> user = data?['user'];
                      // Access the 'teams' field under 'user'
                      final List<dynamic> userTeamsIds = user['teams'];
                      final List<String> stringUserTeamsIds = userTeamsIds.map((id) => id.toString()).toList();
                      // print("TEAM IDS: $stringUserTeamsIds");
                      final Future<List<Map<String, dynamic>>> userTeams = fetchUserTeams(stringUserTeamsIds);
                      
                      return FutureBuilder<List<Map<String, dynamic>>>(
                        future: userTeams,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                            List<Map<String, dynamic>> teams = snapshot.data!;
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: teams.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> team = teams[index]['bsTeam'];
                                String teamId = team['_id'];
                                String teamName = team['teamName'];
                                String region = team['region'];
                                String imageString = team['imageString'] ?? "";
                                int maxTeamSize = team['maximumTeamSize'];
                                int memberListSize = team['memberList'].length;
                                return GestureDetector(
                                  onTap: () => {context.go("/edit_team/$teamId")}, 
                                  child: TeamManageCard(
                                    teamId: teamId,
                                    teamName: teamName,
                                    gameName: "Brawl Stars",
                                    region: region,
                                    imageString: imageString,
                                    maxTeamSize: maxTeamSize,
                                    memberListSize: memberListSize,
                                  ),
                                );
                              },
                            );
                          } else {
                            return const Text('No teams to display :(');
                          }
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
        ),
        floatingActionButton: SizedBox(
          height: 100.0,
          width: 100.0,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer, 
              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer, 
              onPressed: () => {context.go("/create_team/:id")}, 
              child: const Icon(Icons.add)
            ),
          ),
        ),
      bottomNavigationBar: const BottomNavBar(current: "manage"),
    );
  }
}