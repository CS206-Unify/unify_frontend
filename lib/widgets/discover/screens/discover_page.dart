import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unify/model/discover/discover_model.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';
import 'package:unify/widgets/discover/form/select_discover.dart';
import 'package:unify/widgets/discover/form/select_game.dart';
import 'package:unify/widgets/discover/heading/discover_heading.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(title: "Discover"),
      body: Container(
          margin: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: ChangeNotifierProvider(
              create: (context) => DiscoverModel(),
              child: const Wrap(
                runSpacing: 24,
                children: [
                  Wrap(
                    runSpacing: 16,
                    children: [
                      DiscoverHeading(text: "Select Game"),
                      SelectGame()
                    ],
                  ),
                  Wrap(
                    runSpacing: 16,
                    children: [
                      DiscoverHeading(text: "Looking for"),
                      SelectDiscover()
                    ],
                  )
                ],
              ))),
      bottomNavigationBar: const BottomNavBar(current: "discover"),
    );
  }
}
