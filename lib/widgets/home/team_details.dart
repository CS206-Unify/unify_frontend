import 'package:flutter/material.dart';
import 'package:unify/widgets/home/team_stats.dart';

class TeamDetails extends StatelessWidget {

  final String teamName;
  final String region;
  final String logoUrl;
  final int numMembers;
  final List<int> teamStats;

  TeamDetails({Key? key, required this.teamName, required this.region, required this.logoUrl, required this.numMembers, required this.teamStats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              style: Theme.of(context).textTheme.titleSmall?.apply(color: Theme.of(context).colorScheme.onSecondaryContainer),
              '$teamName',
            ),
            Text(
              style: TextStyle(
                color: Theme.of(context).colorScheme.outline,
              ),
              " • $region",
            ),
          ],
        ), //team name + AP
        SizedBox(
          height: 5.0,
        ),
        Row(
          children: <Widget>[
            CircleAvatar(
              foregroundImage: AssetImage('assets/images/logos/$logoUrl'),
              radius: 24.0,
            ),
            SizedBox(
              width: 8.0,
            ),
            Column(
              children: <Widget>[
                Icon(
                  Icons.group_outlined,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 25.0,
                  weight: 0.5,
                ),
                Text(
                  style: Theme.of(context).textTheme.bodySmall?.apply(color: Theme.of(context).colorScheme.secondary),
                  '$numMembers/10',
                ),
              ],
            ),
          ],
        ), //team logo + num of team members
        SizedBox(
          height: 4.0,
        ),
        Text(
          style: Theme.of(context).textTheme.labelSmall?.apply(color: Theme.of(context).colorScheme.onSecondaryContainer),
          "Recruiting",
        ), //"Recruiting"
        SizedBox(
          height: 4.0,
        ),
        TeamStats(trophies: teamStats.elementAt(0), wins3v3: teamStats.elementAt(1), duoWins: teamStats.elementAt(2), soloWins: teamStats.elementAt(3)),
      ],
    );
  }
}