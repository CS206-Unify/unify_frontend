import 'package:flutter/material.dart';
import 'package:unify/widgets/profile/button/routing_buttons.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           RoutingButton(text: "Go to brawl stars profile", location: "/brawl_stars_profile")
        ],
      )),
    );
  }
}
