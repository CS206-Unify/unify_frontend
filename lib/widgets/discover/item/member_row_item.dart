import 'package:unify/data/unify-spring/serializers/discover/team_member_details_model.dart';
import 'package:flutter/material.dart';

class MemberItem extends StatelessWidget {
  final TeamMemberDetails member;

  const MemberItem({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage:
            AssetImage(member.imageUrl), // Replace with your actual logo asset
      ),
      title: Text(member.name),
      trailing: Row(
        mainAxisSize:
            MainAxisSize.min, // makes the Row only as wide as its children
        children: [
          Text('${member.trophies}'),
          Icon(Icons.emoji_events, color: Colors.orange),
        ],
      ),
    );
  }
}
