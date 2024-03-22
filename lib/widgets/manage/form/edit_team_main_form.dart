import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unify/utils/constants/filter_dropdown_choices.dart';

class EditTeamMainForm extends StatelessWidget {
  const EditTeamMainForm(
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
      spacing: 24,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width - 48,
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: "Team Name", labelText: "Team Name", filled: true),
              validator: (value) {
                return value == null || value.isEmpty
                    ? "Please enter your desired team name"
                    : null;
              },
              controller: teamNameController,
            )),
        DropdownMenu(
            controller: regionController,
            width: MediaQuery.of(context).size.width - 48,
            label: const Text("Region"),
            inputDecorationTheme: const InputDecorationTheme(
                filled: true, constraints: BoxConstraints.expand()),
            dropdownMenuEntries: regionEntries),
        SizedBox(
            width: MediaQuery.of(context).size.width - 48,
            child: TextFormField(
              controller: maxTeamSizeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "Maximum Team Size",
                  labelText: "Maximum Team Size",
                  filled: true),
              validator: (value) {
                return value == null || int.parse(value) < 3
                    ? "Please enter a valid team size that is more than or equals to 2"
                    : null;
              },
            ))
      ],
    );
  }
}
