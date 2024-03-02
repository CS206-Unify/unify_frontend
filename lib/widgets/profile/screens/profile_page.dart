import 'package:flutter/material.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/profile/edit_profile_icon.dart';
import 'package:unify/widgets/profile/top_profile_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopProfileBar(),
      body: Center(
          child: Column(
        children: <Widget>[
          EditProfileIcon(),
        ],
      )),
      bottomNavigationBar: const BottomNavBar(current: ""),
    );
  }
}
