import 'package:flutter/material.dart';
import 'package:unify/utils/constants/bs_profile_dropdown_choices.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';

const List<String> list = <String>['Any','North America', 'Latin America', 'Brazil', 'Europe', 'Korea', 'Asia Pacific'];
String dropdownValue = 'Any';
var _controller = TextEditingController();

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
  final apiUrl = "https://jsonplaceholder.typicode.com/posts";

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
            SizedBox(
              height:20 ,
            ),
            //Attempt at Region Drop Down Menu instead
            Center(
              child: DropdownMenu(
                label: const Text('Region'),
                width: 350,
                initialSelection: regionEntries[0].value,
                dropdownMenuEntries: regionEntries,
                inputDecorationTheme: const InputDecorationTheme(
                  filled: true, 
                  constraints: BoxConstraints.expand()
                ),
              ),
            ),
            
            SizedBox(height: 20,),

            //Title for personal Bio
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text('Personal Bio',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            
              //Card for Personal Bio
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Stack(
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Brawl Stars Bio',
                        hintText: 'Enter Bio',
                        alignLabelWithHint: true,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffix: IconButton(
                          iconSize: 28,
                          alignment: Alignment.center,
                          onPressed: _controller.clear,
                          icon: const Icon(Icons.highlight_off),
                        ),
                      ),
                      maxLines: 8,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 170),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return const AlertDialog(
                    //       content: Text('Your bio have been saved',
                    //         textAlign: TextAlign.center,
                    //       ),
                    //     );
                    //   },
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),  
                  child: Text('Save Bio'),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(current: "brawl_stars_profile"),
    );
  }
}