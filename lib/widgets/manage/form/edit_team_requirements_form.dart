import 'package:flutter/material.dart';
import 'package:unify/utils/constants/filter_dropdown_choices.dart';

class EditTeamRequirementsForm extends StatelessWidget {
  const EditTeamRequirementsForm(
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
      spacing: 24,
      children: [
        DropdownMenu(
            controller: trophyRequirementsController,
            width: MediaQuery.of(context).size.width - 48,
            label: const Text("Trophy Requirements"),
            inputDecorationTheme: const InputDecorationTheme(
                filled: true, constraints: BoxConstraints.expand()),
            dropdownMenuEntries: trophiesEntries),
        DropdownMenu(
            controller: minWins3v3Controller,
            width: MediaQuery.of(context).size.width - 48,
            label: const Text("Min. 3v3 Wins"),
            inputDecorationTheme: const InputDecorationTheme(
                filled: true, constraints: BoxConstraints.expand()),
            dropdownMenuEntries: wins3v3Entries),
        DropdownMenu(
            controller: minWins2v2Controller,
            width: MediaQuery.of(context).size.width - 48,
            label: const Text("Min. 2v2 Wins"),
            inputDecorationTheme: const InputDecorationTheme(
                filled: true, constraints: BoxConstraints.expand()),
            dropdownMenuEntries: wins2v2Entries),
        DropdownMenu(
            controller: minSoloWinsController,
            width: MediaQuery.of(context).size.width - 48,
            label: const Text("Min. Solo Wins"),
            inputDecorationTheme: const InputDecorationTheme(
                filled: true, constraints: BoxConstraints.expand()),
            dropdownMenuEntries: soloWinsEntries),
      ],
    );
  }
}
