import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/data/unify-spring/discover.dart';
import 'package:unify/data/unify-spring/serializers/discover/team_listing_model.dart';
import 'package:unify/model/discover/filters_model.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';
import 'package:unify/widgets/discover/card/team_card.dart';
import 'package:unify/widgets/discover/dialog/filter_dialog.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key});

  @override
  State<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  final List<TeamListing> _teams = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(
        title: "Teams",
        game: "bs",
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Consumer<FiltersModel>(
          builder: (context, formValues, child) => FutureBuilder(
              future: discoverTeam(
                  formValues.getRegion,
                  formValues.getTrophies,
                  formValues.getWins3v3,
                  formValues.getWins2v2,
                  formValues.getSoloWins,
                  1000,
                  0),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  _teams.clear();
                  _teams.addAll(snapshot.data!);
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _teams.length,
                      itemBuilder: (BuildContext context, int index) => Column(
                            children: [
                              const SizedBox(
                                height: 24,
                              ),
                              TeamCard(
                                id: _teams[index].id,
                                teamName: _teams[index].name,
                                region: _teams[index].region,
                                requiredTrophies: _teams[index].trophies,
                                wins3v3: _teams[index].wins3v3,
                                wins2v2: _teams[index].wins2v2,
                                soloWins: _teams[index].soloWins,
                                currentTeamSize: _teams[index].currentTeamSize,
                                maximumTeamSize: _teams[index].maximumTeamSize,
                              )
                            ],
                          ));
                }
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showDialog(
              context: context,
              useRootNavigator: false,
              builder: (BuildContext context) => const FilterDialog())
        },
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        child: const Icon(Icons.filter_alt_outlined),
      ),
      bottomNavigationBar: const BottomNavBar(current: "discover"),
    );
  }
}
