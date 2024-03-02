import 'package:flutter/material.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/profile/edit_profile_icon.dart';
import 'package:unify/widgets/profile/top_profile_bar.dart';

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
              margin: EdgeInsets.all(10.0),
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
              width: 200,
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
              margin: EdgeInsets.all(20.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Integrations",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.apply(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(current: ""),
    );
  }
}
