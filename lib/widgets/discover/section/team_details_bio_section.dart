import 'package:flutter/material.dart';
import 'package:unify/data/unify-spring/serializers/discover/team_member_details_model.dart';
import 'package:unify/data/unify-spring/serializers/discover/team_member_model.dart';
import 'package:unify/widgets/discover/item/member_row_item.dart';
import 'package:unify/data/unify-spring/discover.dart';

class TeamBioScreen extends StatefulWidget {
  TeamBioScreen({
    super.key,
    required this.memberList,
  });

  final List<TeamMember> memberList;

  @override
  State<TeamBioScreen> createState() => _TeamBioScreenState();
}

class _TeamBioScreenState extends State<TeamBioScreen> {
  // final List<TeamMemberDetails> members = [
  //   TeamMemberDetails(
  //       name: 'Benjamin Gan',
  //       trophies: 114918,
  //       imageUrl: 'path/to/avatar1.png'),
  //   TeamMemberDetails(
  //       name: 'Dexter', trophies: 15789, imageUrl: 'path/to/avatar2.png'),
  // ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Team Bio',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16.0,
                          ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 6),
                      child: Text(
                        'Newly formed team looking to grow and compete. Looking for scrims to prepare for premier and tournaments!',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Color.fromARGB(255, 241, 238, 238),
                              fontSize: 13.0,
                            ),
                      ),
                    )
                  ])),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Members',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16.0,
                  ),
            ),
          ),
          ListView.builder(
            physics:
                NeverScrollableScrollPhysics(), // to disable ListView's scrolling
            shrinkWrap: true, // Use children's total height
            itemCount: widget.memberList.length,
            itemBuilder: (context, index) {
              return FutureBuilder(
                  key: ValueKey(
                      widget.memberList[index].id), // Ensures uniqueness
                  future: getTeamMemberDetailsById(widget.memberList[index].id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else {
                      return MemberItem(
                          member: TeamMemberDetails(
                              name: snapshot.data!.name,
                              trophies: snapshot.data!.trophies,
                              imageUrl: snapshot.data!.imageUrl));
                    }
                  });
            },
          ),
        ],
      ),
    );
  }
}
