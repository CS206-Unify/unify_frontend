import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:unify/model/discover/edit_team_model.dart';
import 'package:unify/utils/constants/filter_dropdown_choices.dart';
import 'package:unify/widgets/discover/form/dropdown_menu/filter_dropdown_menu.dart';

class EditTeamMainForm extends StatelessWidget {
  const EditTeamMainForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EditTeamModel>(
        builder: (context, formValues, child) => Wrap(
              direction: Axis.vertical,
              spacing: 24,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Team Name",
                      labelText: "Team Name",
                      filled: true),
                  validator: (value) {
                    return value == null || value.isEmpty
                        ? "Please enter your desired team name"
                        : null;
                  },
                  onChanged: (val) => formValues.setTeamName(val),
                ),
                FilterDropdownMenu(
                    label: "Region",
                    choices: regionEntries,
                    onSelected: (value) => formValues.setRegion(value)),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                      hintText: "Maximum Team Size",
                      labelText: "Maximum Team Size",
                      filled: true),
                  validator: (value) {
                    return value == null || int.parse(value) < 3
                        ? "Please enter a valid team size that is more than or equals to 2"
                        : null;
                  },
                )
              ],
            ));
  }
}
