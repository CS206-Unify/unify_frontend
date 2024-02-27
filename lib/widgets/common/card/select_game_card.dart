import 'package:flutter/material.dart';

class SelectGameCard extends StatelessWidget {

  final String url;
  SelectGameCard({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9.0),
      ),
      elevation: 10,
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 160.0,
        child: Image(
          image: AssetImage('assets/images/game_banner/$url'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

