import 'package:flutter/material.dart';
import 'package:unify/data/unify-spring/bsprofileinfo.dart';
import 'package:unify/data/unify-spring/serializers/authentication/bsprofile_serializer.dart';
import 'package:unify/main.dart';
import 'package:unify/utils/constants/bs_profile_dropdown_choices.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';

class BrawlStarsProfilePage extends StatefulWidget {
  const BrawlStarsProfilePage(
      {super.key, this.title, this.game, this.profileImg});
  final String? title;
  final String? game;
  final String? profileImg;

  @override
  State<BrawlStarsProfilePage> createState() => _BrawlStarsProfilePageState();

  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

//Controller Function
class BrawlStarsProfileController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String userRegion = '';
  String userPersonalBio = '';

  void updateUserRegion(String newValue) {
    userRegion = newValue;
  }

  void updateUserPersonalBio(String newValue) {
    userPersonalBio = newValue;
  }

  void clearUserPersonalBio() {
    userPersonalBio = '';
  }

  //For Saving Profile
  Future<void> saveProfile() async {
    try {
      // Call putBSProfile function to save the bio
      BSProfileRequest bsProfileRequest = BSProfileRequest(
        region: userRegion,
        personalBio: userPersonalBio,
      );

      // Call putBSProfile function to save the bio
      await putBSProfile(bsProfileRequest);

      // Update UI with the updated profile data
      updateUserRegion(userRegion);
      updateUserPersonalBio(userPersonalBio);

      // Replace SnackBarService with your implementation
      SnackBarService.showSnackBar(content: 'Changes Saved');
    } catch (e) {
      // Handle errors, e.g., show error message
      SnackBarService.showSnackBar(content: e.toString());
    }
  }
}

class _BrawlStarsProfilePageState extends State<BrawlStarsProfilePage> {
  //Intialise controller
  final BrawlStarsProfileController _controller = BrawlStarsProfileController();
  late final TextEditingController _bioTextController;

  @override
  void initState() {
    super.initState();
    _bioTextController = TextEditingController();
  }

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
            const SizedBox(
              height: 20,
            ),
            Center(
              child: FutureBuilder(
                future: getBSProfile(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    // Show an error message if the future throws an error
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    _controller.userRegion = snapshot.data!.region ?? "";
                    return DropdownMenu(
                      label: const Text('Region'),
                      width: 350,
                      initialSelection: snapshot.data!.region,
                      onSelected: (newValue) {
                        _controller.userRegion = newValue!;
                      },
                      dropdownMenuEntries: regionEntries,
                      inputDecorationTheme: const InputDecorationTheme(
                          filled: true, constraints: BoxConstraints.expand()),
                    );
                  } else {
                    // Handle the case where there is no data
                    return const Text('No selection');
                  }
                },
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //Title for personal Bio
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                'Personal Bio',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),

            //Card for Personal Bio
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: FutureBuilder(
                future: getBSProfile(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    // Show an error message if the future throws an error4
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    _controller.userPersonalBio = snapshot.data!.personalBio ?? "";
                    _bioTextController.text = snapshot.data!.personalBio ?? "";

                    return Stack(
                      children: [
                        TextField(
                          //State management for region
                          controller: _bioTextController,
                          onChanged: (newValue) {
                            _controller.updateUserPersonalBio(newValue);
                          },

                          decoration: InputDecoration(
                            filled: true,
                            labelText: 'Brawl Stars Bio',
                            hintText: 'Enter Bio',
                            alignLabelWithHint: true,
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffix: IconButton(
                              iconSize: 28,
                              alignment: Alignment.center,
                              //Using controller to change state
                              onPressed: () {
                                _bioTextController.clear();
                                _controller.clearUserPersonalBio();
                              },
                              icon: const Icon(Icons.highlight_off),
                            ),
                          ),
                          maxLines: 7,
                        ),
                      ],
                    );
                  } else {
                    return const Text('No selection');
                  }
                },
              ),
            ),
            SizedBox(height: 170),
            Center(
              child: FilledButton(
                onPressed: () {
                  _controller.saveProfile();
                },
                child: const Text('Save Bio'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(current: "brawl_stars_profile"),
    );
  }
}
