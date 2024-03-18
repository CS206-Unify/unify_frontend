import 'package:flutter/material.dart';
import 'package:unify/widgets/common/card/team_manage_card.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';
import 'package:go_router/go_router.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(title: 'Mng. Teams/Scrims'),
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Wrap(
              direction: Axis.horizontal,
              runSpacing: 20,
              children: <Widget>[
                TeamManageCard(),
                TeamManageCard(),
                TeamManageCard(),
                TeamManageCard(),
                TeamManageCard(),
                TeamManageCard(),
                TeamManageCard(),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          height: 100.0,
          width: 100.0,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer, 
              foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer, 
              onPressed: () => {context.go("/home")}, 
              child: Icon(Icons.add)
            ),
          ),
        ),
      bottomNavigationBar: const BottomNavBar(current: "manage"),
    );
  }
}
