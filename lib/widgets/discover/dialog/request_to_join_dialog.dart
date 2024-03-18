import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/data/unify-spring/discover.dart';
import 'package:unify/data/unify-spring/serializers/discover/user_bs_teams_serializer.dart';
import 'package:unify/main.dart';
import 'package:unify/model/discover/invite_to_team_model.dart';
import 'package:unify/widgets/discover/dialog/invite_to_team_dialog_sub_widgets/invite_to_team_checkbox_tile.dart';

class RequestToJoinTeamDialog extends StatefulWidget {
  const RequestToJoinTeamDialog({super.key, required this.teamId});

  final String teamId;

  @override
  State<RequestToJoinTeamDialog> createState() =>
      _RequestToJoinTeamDialogState();
}

class _RequestToJoinTeamDialogState extends State<RequestToJoinTeamDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Request To Join"),
      scrollable: true,
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      content: Column(
        children: [
          Text(
            "Use the following textbox to send a note for your join request message",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
          Text("Request Message"),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
      ],
    );
  }
}
