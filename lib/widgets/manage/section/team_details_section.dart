import 'package:flutter/material.dart';
import 'package:unify/widgets/manage/form/edit_team_main_form.dart';

class TeamDetailsSection extends StatelessWidget {
  const TeamDetailsSection(
      {super.key,
      required this.teamNameController,
      required this.regionController,
      required this.maxTeamSizeController});

  final TextEditingController teamNameController;
  final TextEditingController regionController;
  final TextEditingController maxTeamSizeController;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 12,
      children: [
        Text(
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.apply(color: Theme.of(context).colorScheme.secondary),
            "Team Details"),
        EditTeamMainForm(
            teamNameController: teamNameController,
            regionController: regionController,
            maxTeamSizeController: maxTeamSizeController),
      ],
    );
  }
}
