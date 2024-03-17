import 'package:flutter/material.dart';
import 'package:unify/data/unify-spring/profile.dart';
import 'package:unify/model/profile/userprofile_model.dart';
import 'package:unify/utils/local_storage/secure_storage.dart';
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
  Future<void> logout(BuildContext context) async {
    // Remove the user's token from secure storage to log them out
    SecureStorage.deleteToken();

    // Optionally clear any other user-specific data from shared preferences or other local storage

    router.go("/login");
  }

  List<String> countries = [
    'Any',
    'Singapore',
    'Indonesia',
    'Malaysia',
    'Philippines'
  ];
  String? selectedCountry = 'Any';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopProfileBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            EditProfileIcon(),
            FutureBuilder<UserProfile>(
              future: getUserProfile(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  print(snapshot.data);
                  return Text("Error: ${snapshot.error}");
                } else if (snapshot.hasData) {
                  // Data is now a non-null UserProfile
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      snapshot.data!.username,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.apply(color: Theme.of(context).colorScheme.primary),
                    ),
                  );
                } else {
                  // Handle the case where there is no error, but data is still null
                  return Text("No data available");
                }
              },
            ),
            FutureBuilder<UserProfile>(
              future: getUserProfile(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  print(snapshot.data);
                  return Text("Error: ${snapshot.error}");
                } else if (snapshot.hasData) {
                  // Data is now a non-null UserProfile
                  return Text(
                    snapshot.data!.email,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.apply(color: Theme.of(context).colorScheme.secondary),
                  );
                } else {
                  // Handle the case where there is no error, but data is still null
                  return Text("No data available");
                }
              },
            ),
            Container(
              width: 300,
              height: 60,
              child: FutureBuilder<UserProfile>(
                future:
                    getUserProfile(), // This future must return a non-nullable String
                builder: (BuildContext context,
                    AsyncSnapshot<UserProfile> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Country', // Label text
                        labelStyle: TextStyle(
                            color: Color.fromARGB(
                                255, 121, 121, 121)), // Label style
                      ),
                      value: snapshot.data!.country,
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.white), // Dropdown icon and its color
                      iconSize: 24,
                      dropdownColor: const Color.fromARGB(255, 53, 57,
                          59), // Background color of the dropdown items
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16), // Style of the dropdown items
                      onChanged: (String? newValue) async {
                        setState(() {
                          putCountryForUserProfile(newValue);
                          selectedCountry = newValue;
                        });
                        await putCountryForUserProfile(newValue);
                      },
                      items: countries
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    );
                  } else {
                    // Handle the case where there is no data
                    return Text('No initial country selected');
                  }
                },
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
                      color: Color(0xFF2C292F),
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
                      color: Color(0xFF2C292F),
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
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/images/logos/CODM.webp',
                        fit: BoxFit.fill,
                      ),
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  logout(context);
                },
                icon: Icon(
                  Icons.logout,
                  color: Theme.of(context).colorScheme.onPrimary,
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
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  ),
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
