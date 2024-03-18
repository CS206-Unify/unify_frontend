import 'package:flutter/material.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';
import 'package:unify/widgets/discover/dialog/request_to_join_dialog.dart';

class TeamDetailsPage extends StatefulWidget {
  const TeamDetailsPage({
    super.key,
    required this.teamId,
  });

  final String teamId;

  @override
  State<TeamDetailsPage> createState() => _TeamDetailsPageState();
}

class _TeamDetailsPageState extends State<TeamDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(game: "bs", title: "Team Details"),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("This is TeamDetails Page")],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Wrap(
        spacing: 12,
        children: [
          FilledButton(
              onPressed: () {
                showDialog(
                  context: context,
                  useRootNavigator: false,
                  builder: (BuildContext context) {
                    return RequestToJoinTeamDialog(teamId: widget.teamId);
                  },
                );
              },
              child: const Text("Request to Join"))
        ],
      ),
      bottomNavigationBar: const BottomNavBar(
        current: "discover",
      ),
    );
  }
}
