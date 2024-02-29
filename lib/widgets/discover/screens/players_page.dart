import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(
        title: "Players",
        game: "bs",
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            PlayerCard(
                name: "BenjaminGan",
                trophies: 114918,
                wins3v3: 50212,
                region: "NA",
                brawler: "Pam",
                rank: 35)
          ],
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
