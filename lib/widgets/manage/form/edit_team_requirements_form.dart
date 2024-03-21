import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/model/discover/edit_team_model.dart';
import 'package:unify/utils/constants/filter_dropdown_choices.dart';
import 'package:unify/widgets/discover/form/dropdown_menu/filter_dropdown_menu.dart';

class EditTeamRequirementsForm extends StatelessWidget {
  const EditTeamRequirementsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EditTeamModel>(
        builder: (context, formValues, child) => Wrap(
              direction: Axis.vertical,
              spacing: 24,
              children: [
                FilterDropdownMenu(
                    choices: trophiesEntries,
                    label: "Trophy Requirements",
                    onSelected: (value) => formValues.setMinTrophies(value)),
                FilterDropdownMenu(
                    label: "Min. 3v3 Wins",
                    choices: wins3v3Entries,
                    onSelected: (value) => formValues.setMinWins3v3(value)),
                FilterDropdownMenu(
                    choices: wins2v2Entries,
                    label: "Min. 2v2 Wins",
                    onSelected: (value) => formValues.setMinWins2v2(value)),
                FilterDropdownMenu(
                    label: "Min. Solo Wins",
                    choices: soloWinsEntries,
                    onSelected: (value) => formValues.setMinWinsSolo(value)),              ],
            ));
  }
}
