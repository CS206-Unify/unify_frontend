import 'package:flutter/material.dart';

class TeamManageCard extends StatelessWidget {
  const TeamManageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: 360,
        height: 104,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 1,
              right: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                child: Container(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  width: 36.0,
                  height: 36.0,
                ),
              ), //purple bg
            ),
            Positioned(
              top: 4,
              right: 4,
              child: CircleAvatar(
                radius: 15.0,
                foregroundImage: AssetImage('assets/images/logos/BS.png')), //game logo on top right hand corner
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12.0, 15.0, 12.0, 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 38.0,
                    foregroundImage: (AssetImage('assets/images/logos/Unify.png')),
                  ), //team avatar
                  SizedBox(
                    width: 10.0,
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 5.0,
                    children: <Widget>[
                      Text(
                        style: Theme.of(context).textTheme.titleSmall?.apply(color: Theme.of(context).colorScheme.onSecondaryContainer),
                        'Team Ninja',
                      ), //team name
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.group_outlined,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 18.0,
                            weight: 0.5,
                          ),
                          SizedBox(
                            width: 7.0,
                          ),
                          Text(
                            style: Theme.of(context).textTheme.bodySmall?.apply(color: Theme.of(context).colorScheme.secondary),
                            '5/10',
                          ),
                        ],
                      ), //num of team members
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}