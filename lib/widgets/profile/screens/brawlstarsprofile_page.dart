import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
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
            //Outside padding for Card
            Padding(
              padding: const EdgeInsets.all(15.0),

              //Card for Region
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Region',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context).colorScheme.inverseSurface,
                              ),
                            ), 
                            DropdownButton<String>(
                              isExpanded: true,
                              items: list.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                );
                              }).toList(),
                              value: dropdownValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              borderRadius: BorderRadius.zero,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text('Personal Bio',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(current: "brawl_stars_profile"),
    );
  }
}
