import 'package:flutter/material.dart';
import 'package:unify/utils/constants/filter_dropdown_choices.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';

class EditTeamPage extends StatefulWidget {
  const EditTeamPage({super.key});

  @override
  State<EditTeamPage> createState() => _EditTeamPageState();
}

class _EditTeamPageState extends State<EditTeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
        title: 'Edit Team',
        game: 'bs',
      ),
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
                backgroundImage: AssetImage("assets/images/logos/Unify.png"),
                // child: Icon(
                //   const IconData(0xe130, fontFamily: 'MaterialIcons'),
                //   color: Theme.of(context).colorScheme.secondary,
                //   size: 40.0,
                // ),
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
                      style: Theme.of(context).textTheme.titleMedium?.apply(
                          color: Theme.of(context).colorScheme.secondary),
                      "Team Details"),
                  const SizedBox(
                    height: 10.0,
                  ),
                ]),
          ),
          Center(
            child: SizedBox(
              width: 370,
              child: TextField(
                //State management for region
                // controller: _bioTextController,
                // onChanged: (newValue) {
                //   _controller.updateUserPersonalBio(newValue);
                // },

                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Team Name',
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: DropdownMenu(
              label: Text('Region'),
              width: 370,
              initialSelection: "",
              dropdownMenuEntries: regionEntries,
              inputDecorationTheme: InputDecorationTheme(
                  filled: true, constraints: BoxConstraints.expand()),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: SizedBox(
              width: 370,
              child: TextField(
                //State management for region
                // controller: _bioTextController,
                // onChanged: (newValue) {
                //   _controller.updateUserPersonalBio(newValue);
                // },

                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Maximum Team Size',
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
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
                      style: Theme.of(context).textTheme.titleMedium?.apply(
                          color: Theme.of(context).colorScheme.secondary),
                      "Members"),
                  const SizedBox(
                    height: 10.0,
                  ),
                ]),
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
                      style: Theme.of(context).textTheme.titleMedium?.apply(
                          color: Theme.of(context).colorScheme.secondary),
                      "Recruitment Requirements"),
                  const SizedBox(
                    height: 10.0,
                  ),
                ]),
          ),
          Center(
            child: DropdownMenu(
              label: Text('Trophy Requirements'),
              width: 370,
              initialSelection: 0,
              dropdownMenuEntries: trophiesEntries,
              inputDecorationTheme: InputDecorationTheme(
                  filled: true, constraints: BoxConstraints.expand()),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: DropdownMenu(
              label: Text('Min. 3v3 Wins'),
              width: 370,
              initialSelection: 0,
              dropdownMenuEntries: wins3v3Entries,
              inputDecorationTheme: InputDecorationTheme(
                  filled: true, constraints: BoxConstraints.expand()),
            ),
          ),
                    const SizedBox(
            height: 20.0,
          ),
          Center(
            child: DropdownMenu(
              label: Text('Min. Duo Wins'),
              width: 370,
              initialSelection: 0,
              dropdownMenuEntries: wins2v2Entries,
              inputDecorationTheme: InputDecorationTheme(
                  filled: true, constraints: BoxConstraints.expand()),
            ),
          ),
                    const SizedBox(
            height: 20.0,
          ),
          Center(
            child: DropdownMenu(
              label: Text('Min. Solo Wins'),
              width: 370,
              initialSelection: 0,
              dropdownMenuEntries: soloWinsEntries,
              inputDecorationTheme: InputDecorationTheme(
                  filled: true, constraints: BoxConstraints.expand()),
            ),
          ),

           SizedBox(height: 30),
            Center(
              child: FilledButton(
                onPressed: () {
                  //Pending Function
                },
                child: Text(
                  'Leave Team',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                  ),
                style: FilledButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.errorContainer,
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(current: "brawl_stars_profile"),

    );
  }
}
