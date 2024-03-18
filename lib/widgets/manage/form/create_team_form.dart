import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/model/manage/create_team_model.dart';

class CreateTeamForm extends StatefulWidget {
  const CreateTeamForm({super.key});

  @override
  State<CreateTeamForm> createState() => _CreateTeamFormState();
}

class _CreateTeamFormState extends State<CreateTeamForm> {
  var _regions = ["Asia Pacific", "Europe", "United States"];
  var _games = ["Brawl Stars", "Mobile Legends Bang Bang", "PUBG"];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromRGBO(0, 0, 0, 0),
      child: Consumer<CreateTeamModel>(builder: (context, formValues, child) {
        return Wrap(
          runSpacing: 16,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  hintText: "Team Name", labelText: "Team Name", filled: true),
              validator: (value) {
                return value == null || value.isEmpty
                    ? "Please enter a team name"
                    : null;
              },
              onChanged: (val) => {formValues.setTeamName(val)},
            ),
            //dropdown here
            DropdownButtonFormField(
              items: _regions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              iconSize: 34.0,
              dropdownColor: Theme.of(context).colorScheme.outlineVariant,
              decoration: const InputDecoration(
                  hintText: "Region", labelText: "Region", filled: true),
              validator: (value) {
                return value == null || value.isEmpty
                    ? "Please choose a region"
                    : null;
              },
              onChanged: (val) => {formValues.setRegion(val!)},
            ),
            DropdownButtonFormField(
              items: _games.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              iconSize: 34.0,
              dropdownColor: Theme.of(context).colorScheme.outlineVariant,
              decoration: const InputDecoration(
                  hintText: "Game", labelText: "Game", filled: true),
              validator: (value) {
                return value == null || value.isEmpty
                    ? "Please choose a game"
                    : null;
              },
              onChanged: (val) => {formValues.setGameName(val!)},
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Maximum Team Size",
                labelText: "Maximum Team Size",
                filled: true,
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                return value == null || value.isEmpty
                    ? "Please enter a maximum team size"
                    : null;
              },
              onChanged: (val) {
                if (val.isNotEmpty) {
                  print('formValues: $formValues');
                  formValues.setMaximumTeamSize(int.parse(val));
                }
              },
            ),
          ],
        );
      }),
    );
  }
}
