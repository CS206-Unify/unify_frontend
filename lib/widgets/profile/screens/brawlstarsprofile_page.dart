import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';

const List<String> list = <String>['Any','North America', 'Latin America', 'Brazil', 'Europe', 'Korea', 'Asia Pacific'];
String dropdownValue = 'Any';

class BrawlStarsProfilePage extends StatefulWidget {
  const BrawlStarsProfilePage({super.key, this.title, this.game, this.profileImg});
  final String? title;
  final String? game;
  final String? profileImg;

  @override
  State<BrawlStarsProfilePage> createState() => _BrawlStarsProfilePageState();

  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _BrawlStarsProfilePageState extends State<BrawlStarsProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(
        title: 'Brawl Stars Profile',
        game: 'bs',
        ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: DropdownButton<String>(
                items: list.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: dropdownValue,
                onChanged: (String? newValue) {
                  // Handle dropdown value change
                  setState(() {
                    //dropdownValue = value!;
                  });
                },
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
