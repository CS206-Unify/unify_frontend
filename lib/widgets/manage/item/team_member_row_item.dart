import 'package:unify/data/unify-spring/serializers/discover/team_member_details_model.dart';
import 'package:flutter/material.dart';
import 'package:unify/utils/formatter/number_formatter.dart';

class TeamMemberRow extends StatefulWidget {
  const TeamMemberRow({super.key, required this.member});

  final TeamMemberDetails member;

  @override
  State<TeamMemberRow> createState() => _TeamMemberRowState();
}

class _TeamMemberRowState extends State<TeamMemberRow> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              12), // Adjust the radius here to match your design
          image: const DecorationImage(
            image: AssetImage(
                "assets/images/avatars/BenjaminGan.png"), // Replace with your actual image path
            fit: BoxFit.cover,
          ),
        ),
        width: 40, // Set your desired width
        height: 40, // Set your desired height
      ),
      title: Text(
        widget.member.name,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .apply(color: Theme.of(context).colorScheme.primary),
      ),
      trailing: Wrap(
        spacing: 8,
        children: [
          Text(
            thousandFormatter(widget.member.trophies ?? 0),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 13.0,
                ),
          ),
          Image.asset("assets/images/brawlstars/misc/Trophy.png",
              height: 25.0, width: 25.0),
        ],
      ),
    );
  }
}
