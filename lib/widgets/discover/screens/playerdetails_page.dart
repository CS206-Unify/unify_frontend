import 'package:flutter/material.dart';

class PlayerDetailsPage extends StatefulWidget {
  const PlayerDetailsPage({super.key});

  @override
  State<PlayerDetailsPage> createState() => _PlayerDetailsPageState();
}

class _PlayerDetailsPageState extends State<PlayerDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PlayerDetails")),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("This is PlayerDetails Page")],
      )),
    );
  }
}
