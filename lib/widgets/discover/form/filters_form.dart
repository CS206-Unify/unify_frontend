import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/model/discover/filters_model.dart';
import 'package:unify/utils/constants/filter_dropdown_choices.dart';
import 'package:unify/widgets/discover/form/dropdown_menu/filter_dropdown_menu.dart';

class FiltersForm extends StatelessWidget {
  const FiltersForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FiltersModel>(
        builder: (context, formValues, child) => Wrap(
              direction: Axis.vertical,
              spacing: 24,
              children: [
                FilterDropdownMenu(
                    label: "Region",
                    choices: regionEntries,
                    onSelected: (value) => formValues.setRegion(value)),
                FilterDropdownMenu(
                    choices: trophiesEntries,
                    label: "Trophies",
                    onSelected: (value) => formValues.setTrophies(value)),
                FilterDropdownMenu(
                    label: "3v3 Wins",
                    choices: wins3v3Entries,
                    onSelected: (value) => formValues.setWins3v3(value)),
                FilterDropdownMenu(
                    choices: wins2v2Entries,
                    label: "2v2 Wins",
                    onSelected: (value) => formValues.setWins2v2(value)),
                FilterDropdownMenu(
                    label: "Solo Wins",
                    choices: soloWinsEntries,
                    onSelected: (value) => formValues.setSoloWins(value)),
              ],
            ));
  }
}
