import 'package:flutter/material.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/profile/edit_profile_icon.dart';
import 'package:unify/widgets/profile/top_profile_bar.dart';
import 'package:unify/router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "Benjamin Gan";
  String email = "benjamin.gan@gmail.com";

  List<String> countries = [
    'Country',
    'Singapore',
    'Indonesia',
    'Malaysia',
    'Philipines'
  ];
  String selectedCountry = 'Country';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopProfileBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            EditProfileIcon(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.apply(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            Text(
              email,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.apply(color: Theme.of(context).colorScheme.secondary),
            ),
            Container(
              width: 300,
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedCountry,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCountry = newValue!;
                  });
                },
                items: countries.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20.0,
                top: 10.0,
                right: 20.0,
                bottom: 10.0,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                "Integrations",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.apply(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 61, 61, 61)
                              .withOpacity(0.9),
                        ),
                      ],
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox.square(
                      dimension: 30,
                      child: Image.asset(
                        'assets/images/logos/Google.png',
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 61, 61, 61)
                              .withOpacity(0.9),
                        ),
                      ],
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox.square(
                      dimension: 30,
                      child: Image.asset(
                        'assets/images/logos/Supercell.png',
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 61, 61, 61)
                              .withOpacity(0.9),
                        ),
                      ],
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox.square(
                      dimension: 30,
                      child: Image.asset(
                        'assets/images/logos/Garena.png',
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 61, 61, 61)
                              .withOpacity(0.9),
                        ),
                      ],
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox.square(
                      dimension: 30,
                      child: Image.asset(
                        'assets/images/logos/Moonton.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20.0,
                top: 10.0,
                right: 20.0,
                bottom: 10.0,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                "Edit Bio",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.apply(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 61, 61, 61)
                              .withOpacity(0.9),
                        ),
                      ],
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20.0), // Clip it with the same border radius
                      child: Image.asset('assets/images/logos/MLBB.jpg'),
                      // Set the fit to cover to make sure the image covers the rounded corners
                    )),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 61, 61, 61)
                            .withOpacity(0.9),
                      ),
                    ],
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: GestureDetector(
                      onTap: () {
                        // Add your navigation logic here
                        router.go("/brawl_stars_profile");
                      },
                      child: Image.asset('assets/images/logos/BS.png'),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 61, 61, 61)
                              .withOpacity(0.9),
                        ),
                      ],
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20.0), // Clip it with the same border radius
                      child: Image.asset(
                        'assets/images/logos/CODM.webp',
                        fit: BoxFit
                            .fill, // Correct placement of the fit property
                      ),
                    )),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 40.0), // Add vertical margin
              child: ElevatedButton.icon(
                onPressed: () {
                  // Your logout logic here
                },
                icon: Icon(
                  Icons.logout, // Choose the icon that fits your design
                  color: Theme.of(context).colorScheme.onPrimary, // Icon color
                ),
                label: Text(
                  "Logout",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary,
                  ), // Background color
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  ), // Button padding
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(current: ""),
    );
  }
}
