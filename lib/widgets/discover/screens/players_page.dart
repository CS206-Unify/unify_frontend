import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/data/unify-spring/discover.dart';
import 'package:unify/data/unify-spring/serializers/discover/profile_listing_serializer.dart';
import 'package:unify/model/discover/filters_model.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';
import 'package:unify/widgets/discover/card/player_card.dart';
import 'package:unify/widgets/discover/dialog/filter_dialog.dart';

class PlayersPage extends StatefulWidget {
  const PlayersPage({super.key});

  @override
  State<PlayersPage> createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  final List<ProfileListing> _profiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(
        title: "Players",
        game: "bs",
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Consumer<FiltersModel>(
          builder: (context, formValues, child) => FutureBuilder(
              future: discoverProfile(
                  formValues.getRegion,
                  formValues.getTrophies,
                  formValues.getWins3v3,
                  formValues.getWins2v2,
                  formValues.getSoloWins,
                  10,
                  0),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  _profiles.addAll(snapshot.data!);
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _profiles.length,
                      itemBuilder: (BuildContext context, int index) => Column(
                            children: [
                              const SizedBox(
                                height: 24,
                              ),
                              PlayerCard(
                                  id: _profiles[index].id,
                                  name: _profiles[index].name,
                                  trophies: _profiles[index].trophies,
                                  wins3v3: _profiles[index].wins3v3,
                                  region: _profiles[index].region,
                                  brawler: _profiles[index].brawler,
                                  rank: _profiles[index].rank)
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
