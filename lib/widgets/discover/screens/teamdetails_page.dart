import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unify/data/unify-spring/discover.dart';
import 'package:unify/data/unify-spring/serializers/discover/team_member_model.dart';
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
  String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('MMMM dd, yyyy');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(game: "bs", title: "Team Details"),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FutureBuilder(
              future: getTeamDetailsById(widget.teamId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return Container(
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
                                backgroundImage: AssetImage(
                                    "assets/images/avatars/teamLogo.png"),
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
                                    snapshot.data!.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontSize: 22.0,
                                        ),
                                  ),
                                  Text(
                                    "Created ${formatDate(snapshot.data!.teamCreationDate)}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          color: Color.fromARGB(
                                              255, 241, 238, 238),
                                          fontSize: 14.0,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Right side: Region name or other content
                          Text(
                            snapshot.data!.region,
                            style: TextStyle(
                              // Add your text style
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }),
          FutureBuilder(
              future: getTeamDetailsById(widget.teamId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return TeamBioScreen(memberList: snapshot.data!.memberList);
                }
              }),
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
