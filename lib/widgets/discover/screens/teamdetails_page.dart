import 'package:flutter/material.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';
import 'package:unify/widgets/discover/dialog/request_to_join_dialog.dart';
import 'package:unify/widgets/discover/section/team_details_bio_section.dart';

class TeamDetailsPage extends StatefulWidget {
  const TeamDetailsPage({
    super.key,
    required this.teamId,
  });

  final String teamId;

  @override
  State<TeamDetailsPage> createState() => _TeamDetailsPageState();
}

class _TeamDetailsPageState extends State<TeamDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(game: "bs", title: "Team Details"),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Color.fromARGB(255, 61, 56, 67),
            width: double.infinity,
            height: 125,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Adjust the padding as needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side: Team logo and name
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatars/teamLogo.png"),
                        radius: 30,
                      ),
                      SizedBox(
                          width:
                              20), // For some spacing between the logo and the text
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Team Ninja",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 22.0,
                                ),
                          ),
                          Text(
                            "Created January 20, 2024",
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Color.fromARGB(255, 241, 238, 238),
                                      fontSize: 14.0,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Right side: Region name or other content
                  Text(
                    "AP",
                    style: TextStyle(
                      // Add your text style
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          TeamBioScreen(),
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Wrap(
        spacing: 12,
        children: [
          FilledButton(
              onPressed: () {
                showDialog(
                  context: context,
                  useRootNavigator: false,
                  builder: (BuildContext context) {
                    return RequestToJoinTeamDialog(teamId: widget.teamId);
                  },
                );
              },
              child: const Text("Request to Join"))
        ],
      ),
      bottomNavigationBar: const BottomNavBar(
        current: "discover",
      ),
    );
  }
}
