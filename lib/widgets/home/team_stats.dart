import 'package:flutter/material.dart';

class TeamStats extends StatelessWidget {
  final String trophies;
  final String wins3v3;
  final String duoWins;
  final String soloWins;

  TeamStats(
      {Key? key,
      required this.trophies,
      required this.wins3v3,
      required this.duoWins,
      required this.soloWins})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/brawlstars/misc/Trophy.png'),
                  width: 23.0,
                  height: 23.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  style: Theme.of(context).textTheme.labelSmall?.apply(
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  '${trophies}K+ trophies',
                )
              ],
            ),
            Row(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/brawlstars/misc/3v3.webp'),
                  width: 23.0,
                  height: 23.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  style: Theme.of(context).textTheme.labelSmall?.apply(
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  '${wins3v3}K+ 3v3 wins',
                )
              ],
            ),
          ],
        ), //trophies + 3v3 wins
        SizedBox(
          width: 20.0,
        ),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image(
                  image: AssetImage(
                      'assets/images/brawlstars/misc/Duo-Showdown.webp'),
                  width: 23.0,
                  height: 23.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  style: Theme.of(context).textTheme.labelSmall?.apply(
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  '$duoWins+ duo wins',
                )
              ],
            ),
            Row(
              children: <Widget>[
                Image(
                  image:
                      AssetImage('assets/images/brawlstars/misc/Showdown.webp'),
                  width: 23.0,
                  height: 23.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  style: Theme.of(context).textTheme.labelSmall?.apply(
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer),
                  '$soloWins+ solo wins',
                )
              ],
            ),
          ],
        ), //duo wins + solo wins
      ],
    );
  }
}
