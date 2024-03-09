import 'package:flutter/material.dart';

class InviteToTeamDialog extends StatelessWidget {
  const InviteToTeamDialog({super.key});

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
          // ListView()
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Invite"))
      ],
    );
  }
}
