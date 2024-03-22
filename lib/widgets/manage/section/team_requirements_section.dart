import 'package:flutter/material.dart';
import 'package:unify/widgets/manage/form/edit_team_requirements_form.dart';

class TeamRequirementsSections extends StatelessWidget {
  const TeamRequirementsSections(
      {super.key,
      required this.trophyRequirementsController,
      required this.minWins3v3Controller,
      required this.minWins2v2Controller,
      required this.minSoloWinsController});

  final TextEditingController trophyRequirementsController;
  final TextEditingController minWins3v3Controller;
  final TextEditingController minWins2v2Controller;
  final TextEditingController minSoloWinsController;

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
        EditTeamRequirementsForm(
            trophyRequirementsController: trophyRequirementsController,
            minWins3v3Controller: minWins3v3Controller,
            minWins2v2Controller: minWins2v2Controller,
            minSoloWinsController: minSoloWinsController)
      ],
    );
  }
}
