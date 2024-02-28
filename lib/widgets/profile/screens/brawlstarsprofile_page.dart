import 'package:flutter/material.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';

class BrawlStarsProfilePage extends StatefulWidget {
  const BrawlStarsProfilePage({super.key});

  @override
  State<BrawlStarsProfilePage> createState() => _BrawlStarsProfilePageState();
}

class _BrawlStarsProfilePageState extends State<BrawlStarsProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("This is Brawl Stars Profile Page")],
      )),
    );
  }
}
