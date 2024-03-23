import 'package:flutter/material.dart';
import 'package:unify/data/unify-spring/discover.dart';
import 'package:unify/data/unify-spring/serializers/discover/team_member_details_model.dart';
import 'package:unify/data/unify-spring/serializers/discover/team_member_model.dart';
import 'package:unify/widgets/manage/item/team_member_row_item.dart';

class TeamMembersSection extends StatefulWidget {
  const TeamMembersSection({super.key, required this.teamId});

  final String teamId;

  @override
  State<TeamMembersSection> createState() => _TeamMembersSectionState();
}

class _TeamMembersSectionState extends State<TeamMembersSection> {
  final List<TeamMember> _memberList = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 12,
      children: [
        Text(
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.apply(color: Theme.of(context).colorScheme.secondary),
            "Team Details"),
        FutureBuilder(
            future: getTeamDetailsById(widget.teamId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                _memberList.clear();
                _memberList.addAll(snapshot.data!.memberList);

                return SizedBox(
                  width: MediaQuery.of(context).size.width -48,
                  child: ListView.builder(
                    physics:
                        const NeverScrollableScrollPhysics(), // to disable ListView's scrolling
                    shrinkWrap: true, // Use children's total height
                    itemCount: _memberList.length,
                    itemBuilder: (context, index) {
                      return FutureBuilder(
                          key: ValueKey(
                              _memberList[index].id), // Ensures uniqueness
                          future:
                              getTeamMemberDetailsById(_memberList[index].id),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Text("Error: ${snapshot.error}");
                            } else {
                              return TeamMemberRow(
                                  member: TeamMemberDetails(
                                      name: snapshot.data!.name,
                                      trophies: snapshot.data!.trophies,
                                      imageUrl: snapshot.data!.imageUrl));
                            }
                          });
                    },
                  ),
                );
              }
            })
      ],
    );
  }
}
