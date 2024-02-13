import 'package:flutter/material.dart';

class TeamDetailsPage extends StatefulWidget {
  const TeamDetailsPage({super.key});

  @override
  State<TeamDetailsPage> createState() => _TeamDetailsPageState();
}

class _TeamDetailsPageState extends State<TeamDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TeamDetails")),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("This is TeamDetails Page")],
      )),
    );
  }
}
