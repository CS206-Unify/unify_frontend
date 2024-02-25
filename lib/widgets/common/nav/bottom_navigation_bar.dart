import 'package:flutter/material.dart';
import 'package:unify/widgets/common/nav/items/bottom_nav_items.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, this.current});
  final String? current;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavItems(
            page: "Home",
            isActive: current == "home",
          ),
          BottomNavItems(page: "Discover", isActive: current == "discover"),
          BottomNavItems(page: "Chats", isActive: current == "chats"),
          BottomNavItems(page: "Manage", isActive: current == "manage")
        ],
      ),
    );
  }
}
