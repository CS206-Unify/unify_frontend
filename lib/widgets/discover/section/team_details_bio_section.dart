import 'package:flutter/material.dart';
import 'package:unify/data/unify-spring/serializers/discover/team_member_details_model.dart';
import 'package:unify/widgets/discover/item/member_row_item.dart';

class TeamBioScreen extends StatelessWidget {
  final List<TeamMemberDetails> members = [
    TeamMemberDetails(
        name: 'Benjamin Gan',
        trophies: 114918,
        imageUrl: 'path/to/avatar1.png'),
    TeamMemberDetails(
        name: 'Dexter', trophies: 15789, imageUrl: 'path/to/avatar2.png'),
    // ... other members
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Newly formed team looking to grow and compete. Looking for scrims to prepare for premier and tournaments!',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Members',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            physics:
                NeverScrollableScrollPhysics(), // to disable ListView's scrolling
            shrinkWrap: true, // Use children's total height
            itemCount: members.length,
            itemBuilder: (context, index) {
              return MemberItem(member: members[index]);
            },
          ),
        ],
      ),
    );
  }
}
