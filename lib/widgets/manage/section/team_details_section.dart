import 'package:flutter/material.dart';
import 'package:unify/widgets/manage/form/edit_team_main_form.dart';

class TeamDetailsSection extends StatelessWidget {
  const TeamDetailsSection({super.key});

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
        const EditTeamMainForm()
      ],
    );
  }
}
