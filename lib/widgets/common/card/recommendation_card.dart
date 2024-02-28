import 'package:flutter/material.dart';

class RecommendationCard extends StatelessWidget {
  
  final Widget display;
  RecommendationCard({Key? key, required this.display}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 10,
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 320.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 1,
              right: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                child: Image.asset(
                  'assets/images/logos/BS.png',
                  height: 30.0,
                  width: 30.0,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ), //game logo on top right hand corner
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: display,
            ),
          ],
        ),
      ),
    );
  }
}