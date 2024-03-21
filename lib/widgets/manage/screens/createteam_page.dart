import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/data/unify-spring/create_team.dart';
import 'package:unify/data/unify-spring/serializers/manage/create_team_serializer.dart';
import 'package:unify/model/manage/create_team_model.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';
import 'package:unify/widgets/manage/form/create_team_form.dart';
import 'package:http/http.dart' as http; 
import 'package:unify/utils/constants/unify_backend.dart' as unify_client;

class CreateTeamPage extends StatefulWidget {
  const CreateTeamPage({super.key});

  @override
  State<CreateTeamPage> createState() => _CreateTeamPageState();
}

class _CreateTeamPageState extends State<CreateTeamPage> {

  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(title: 'Create Team'),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 5.0),
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              CircleAvatar(
                radius: 70.0,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                child: Icon(
                  const IconData(0xe130, fontFamily: 'MaterialIcons'),
                  color: Theme.of(context).colorScheme.secondary,
                  size: 40.0,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 130,
                child: Icon(
                  const IconData(0xef8d, fontFamily: 'MaterialIcons'),
                  color: Theme.of(context).colorScheme.secondary,
                  size: 30.0,
                ),
              ),
            ],
          ),
          const SizedBox(
              height: 10.0,
            ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Text(
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.apply(color: Theme.of(context).colorScheme.secondary),
                "Team Details"),
            const SizedBox(
              height: 10.0,
            ),
              ChangeNotifierProvider(
                create: (context) => CreateTeamModel(),
                child: Form(
                  key: _formKey,
                  child: Wrap(
                    runSpacing: 16,
                    children: [
                      CreateTeamForm(),
                      Center(
                        child: Consumer<CreateTeamModel>(
                            builder: (context, formValues, child) =>
                                FilledButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        createTeam(CreateTeamRequest(
                                            teamName: formValues.getTeamName,
                                            region: formValues.getRegion,
                                            gameName: formValues.getGameName,
                                            language: "",
                                            maximumTeamSize: formValues.getMaximumTeamSize));
                                      }
                                    },
                                    child: const Text("Create Team"))),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(current: "manage"),
    );
  }
}