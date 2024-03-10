import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/data/unify-spring/discover.dart';
import 'package:unify/data/unify-spring/serializers/discover/user_bs_teams_serializer.dart';
import 'package:unify/main.dart';
import 'package:unify/model/discover/invite_to_team_model.dart';
import 'package:unify/widgets/discover/dialog/invite_to_team_dialog_sub_widgets/invite_to_team_checkbox_tile.dart';

class InviteToTeamDialog extends StatefulWidget {
  const InviteToTeamDialog({super.key, required this.userId});

  final String userId;

  @override
  State<InviteToTeamDialog> createState() => _InviteToTeamDialogState();
}

class _InviteToTeamDialogState extends State<InviteToTeamDialog> {
  final List<UserBsTeamsListing> _teams = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Invite to Team"),
      scrollable: true,
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      content: Column(
        children: [
          Text(
            "Choose the teams to invite the player to",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.maxFinite,
            child: FutureBuilder(
                future: getUserBsTeamsListing(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else {
                    _teams.clear();
                    _teams.addAll(snapshot.data!);
                    return _teams.isEmpty
                        ? const Center(
                            child: Text("You are currently not in any teams"))
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: _teams.length,
                            itemBuilder: ((context, index) =>
                                InviteToTeamCheckboxTile(team: _teams[index])));
                  }
                }),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        Consumer<InviteToTeamModel>(
            builder: (context, formValues, child) => TextButton(
                onPressed: _teams.isEmpty
                    ? null
                    : () async {
                        formValues.getMap.forEach((key, value) async {
                          if (value) {
                            await inviteToTeamById(key, widget.userId);
                          }
                        });
                        Navigator.pop(context);
                        SnackBarService.showSnackBar(
                            content:
                                "User has been successfully invited to ${formValues.getMap.keys.length} teams");
                      },
                child: const Text("Invite")))
      ],
    );
  }
}
