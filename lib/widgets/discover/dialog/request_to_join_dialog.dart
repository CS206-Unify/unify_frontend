import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/data/unify-spring/discover.dart';
import 'package:unify/data/unify-spring/serializers/discover/user_bs_teams_serializer.dart';
import 'package:unify/main.dart';
import 'package:unify/model/discover/invite_to_team_model.dart';
import 'package:unify/widgets/discover/dialog/invite_to_team_dialog_sub_widgets/invite_to_team_checkbox_tile.dart';

class RequestToJoinTeamDialog extends StatefulWidget {
  const RequestToJoinTeamDialog(
      {super.key, required this.teamId, required this.onRequested});

  final String teamId;
  final VoidCallback onRequested;

  @override
  State<RequestToJoinTeamDialog> createState() =>
      _RequestToJoinTeamDialogState();
}

class _RequestToJoinTeamDialogState extends State<RequestToJoinTeamDialog> {
  final TextEditingController _messageController = TextEditingController();

  // bool _isRequestSent = false;

  // void _sendRequest() {
  //   setState(() {
  //     _isRequestSent = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: const Text("Request to Join")),
      scrollable: true,
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      content: Column(
        mainAxisSize: MainAxisSize.min, // To make the column wrap its content
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5.0),
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              "Use the following textbox to send a note for your join request message",
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            margin: const EdgeInsets.only(top: 5.0),
            child: Text(
              "Request Message",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          TextField(
            maxLines: 5,
            controller: _messageController,
            decoration: const InputDecoration(
              hintText: "Hi, I wish to join your team!",
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
        ),
        TextButton(
          onPressed: () {
            widget.onRequested();
            Navigator.pop(context);
          },
          child: const Text("Request"),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _messageController.dispose(); // Don't forget to dispose of the controller!
    super.dispose();
  }
}
