import 'package:flutter/material.dart';

class PlayerDetails extends StatelessWidget {

  final String region;
  final String trophies;
  final String name;
  final String avatarUrl;

  PlayerDetails({Key? key, required this.region, required this.trophies, required this.name, required this.avatarUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(9.0),
          child: Image.asset(
            'assets/images/avatars/$avatarUrl',
            height: 140.0,
            width: 140.0,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ), //player profile picture
        SizedBox(
          width: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2.0),
                    child: Image.asset(
                      'assets/images/flags/$region.png',
                      height: 25.0,
                      width: 35.0,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ), // Region Flag
                  ), 
                  Text(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    "  •  AP"
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(1.0),
                    child: Image.asset(
                      'assets/images/brawlstars/misc/Trophy.png',
                      height: 25.0,
                      width: 25.0,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ), // Trophy Logo
                  ), 
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    style: Theme.of(context).textTheme.labelSmall?.apply(color: Theme.of(context).colorScheme.onSecondaryContainer),
                    "$trophies Trophies"
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              style: Theme.of(context).textTheme.titleSmall?.apply(color: Theme.of(context).colorScheme.primary),
              '$name'),
          ],
        ),
      ],
    );
  }
}