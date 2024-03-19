import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecommendationCard extends StatelessWidget {
  
  final Widget display;
  final String route;

  RecommendationCard({Key? key, required this.display, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {context.go("$route")}, 
      child: Card(
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
      ),
    );
  }
}