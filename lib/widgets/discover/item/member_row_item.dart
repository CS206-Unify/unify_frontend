import 'package:unify/data/unify-spring/serializers/discover/team_member_details_model.dart';
import 'package:flutter/material.dart';

class MemberItem extends StatelessWidget {
  final TeamMemberDetails member;

  const MemberItem({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              12), // Adjust the radius here to match your design
          image: DecorationImage(
            image: AssetImage(
                "assets/images/avatars/BenjaminGan.png"), // Replace with your actual image path
            fit: BoxFit.cover,
          ),
        ),
        width: 40, // Set your desired width
        height: 40, // Set your desired height
      ),
      title: Text(
        member.name,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Color.fromARGB(255, 241, 238, 238),
              fontSize: 16.0,
            ),
      ),
      trailing: Row(
        mainAxisSize:
            MainAxisSize.min, // makes the Row only as wide as its children
        children: [
          Text(
            '${member.trophies}',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 13.0,
                ),
          ),
          SizedBox(width: 8),
          Image.asset("assets/images/brawlstars/misc/Trophy.png",
              height: 25.0, width: 25.0),
        ],
      ),
    );
  }
}
