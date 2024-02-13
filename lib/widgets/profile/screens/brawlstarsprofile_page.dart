import 'package:flutter/material.dart';

class BrawlStarsProfilePage extends StatefulWidget {
  const BrawlStarsProfilePage({super.key});

  @override
  State<BrawlStarsProfilePage> createState() => _BrawlStarsProfilePageState();
}

class _BrawlStarsProfilePageState extends State<BrawlStarsProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BrawlStarsProfile")),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("This is BrawlStarsProfile Page")],
      )),
    );
  }
}
