import 'package:flutter/material.dart';
import 'package:unify/widgets/manage/form/edit_team_requirements_form.dart';

class TeamRequirementsSections extends StatelessWidget {
  const TeamRequirementsSections({super.key});

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
            "Recruitment Requirements"),
        const EditTeamRequirementsForm()
      ],
    );
  }
}
