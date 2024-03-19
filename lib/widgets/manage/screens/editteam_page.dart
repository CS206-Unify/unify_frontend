import 'dart:io';
import 'package:flutter/material.dart';
import 'package:unify/utils/constants/filter_dropdown_choices.dart';
import 'package:unify/widgets/common/nav/bottom_navigation_bar.dart';
import 'package:unify/widgets/common/nav/top_app_bar.dart';
import 'package:image_picker/image_picker.dart';

class EditTeamPage extends StatefulWidget {
  const EditTeamPage({super.key});

  @override
  State<EditTeamPage> createState() => _EditTeamPageState();
}

class AvatarChanger extends StatefulWidget {
  @override
  _AvatarChangerState createState() => _AvatarChangerState();
}

class _AvatarChangerState extends State<AvatarChanger> {
  File? _imageFile;
  final picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Change Image"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text("Select from Gallery"),
                    onTap: () {
                      Navigator.pop(context);
                      _pickImage(ImageSource.gallery);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text("Take a Photo"),
                    onTap: () {
                      Navigator.pop(context);
                      _pickImage(ImageSource.camera);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: CircleAvatar(
        radius: 70.0,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        backgroundImage: _imageFile != null
            ? FileImage(_imageFile!)
            : AssetImage("assets/images/logos/Unify.png")
                as ImageProvider<Object>?,
        // child: _imageFile == null
        //     ? Icon(Icons.add_a_photo, size: 40.0)
        //     : null, // Placeholder icon if no image is selected
      
      ),
    );
  }
}

class _EditTeamPageState extends State<EditTeamPage> {
  TextEditingController _teamNameController =
      TextEditingController(text: 'Team Ninja');
  TextEditingController _maxTeamSizeController =
      TextEditingController(text: '10');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
        title: 'Edit Team',
        game: 'bs',
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 5.0),
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              AvatarChanger(),
              Positioned(
                bottom: 10,
                right: 130,
                child: Icon(
                  const IconData(0xef8d, fontFamily: 'MaterialIcons'),
                  color: Theme.of(context).colorScheme.secondary,
                  size: 30.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      style: Theme.of(context).textTheme.titleMedium?.apply(
                          color: Theme.of(context).colorScheme.secondary),
                      "Team Details"),
                  const SizedBox(
                    height: 10.0,
                  ),
                ]),
          ),
          Center(
            child: SizedBox(
              width: 370,
              child: TextField(
                //State management for region
                controller: _teamNameController,
                // onChanged: (newValue) {
                //   _controller.updateUserPersonalBio(newValue);
                // },

                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Team Name',
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: DropdownMenu(
              label: Text('Region'),
              width: 370,
              initialSelection: "",
              dropdownMenuEntries: regionEntries,
              inputDecorationTheme: InputDecorationTheme(
                  filled: true, constraints: BoxConstraints.expand()),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: SizedBox(
              width: 370,
              child: TextField(
                //State management for region
                controller: _maxTeamSizeController,
                // onChanged: (newValue) {
                //   _controller.updateUserPersonalBio(newValue);
                // },

                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Maximum Team Size',
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      style: Theme.of(context).textTheme.titleMedium?.apply(
                          color: Theme.of(context).colorScheme.secondary),
                      "Members"),
                ]),
          ),
          //List of members
          Card(
            color: Colors.transparent, // Set the color to transparent
            elevation: 0, // Optionally, set the elevation to 0 to remove shadow
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(3, 0, 3, 0),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(
                    5), // Adjust the border radius as needed
                child: Image.asset(
                  'assets/images/avatars/BenjaminGan.png',
                  width: 40, // Set the desired width
                  height: 40, // Set the desired height
                ),
              ),
              title: Text(
                  style: Theme.of(context).textTheme.titleMedium?.apply(
                      color: Theme.of(context).colorScheme.onTertiaryContainer),
                  'Benjamin Gan'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '114,918',
                    style: Theme.of(context).textTheme.titleMedium?.apply(
                          color:
                              Theme.of(context).colorScheme.onTertiaryContainer,
                          fontSizeDelta: -3.5, // Adjust the font size as needed
                        ),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/brawlstars/misc/Trophy.png', // Replace with your image path
                    width: 24, // Set the desired width
                    height: 24, // Set the desired height
                  ),
                  // Adjust the spacing between the image and text
                ],
              ),
            ),
          ),

          //Hard code the other cards
          Card(
            color: Colors.transparent, // Set the color to transparent
            elevation: 0, // Optionally, set the elevation to 0 to remove shadow
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(3, 0, 3, 0),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(
                    5), // Adjust the border radius as needed
                child: Image.asset(
                  'assets/images/avatars/BenjaminGan.png',
                  width: 40, // Set the desired width
                  height: 40, // Set the desired height
                ),
              ),
              title: Text(
                  style: Theme.of(context).textTheme.titleMedium?.apply(
                      color: Theme.of(context).colorScheme.onTertiaryContainer),
                  'Dexter'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '114,918',
                    style: Theme.of(context).textTheme.titleMedium?.apply(
                          color:
                              Theme.of(context).colorScheme.onTertiaryContainer,
                          fontSizeDelta: -3.5, // Adjust the font size as needed
                        ),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/brawlstars/misc/Trophy.png', // Replace with your image path
                    width: 24, // Set the desired width
                    height: 24, // Set the desired height
                  ),
                  // Adjust the spacing between the image and text
                ],
              ),
            ),
          ),

          Card(
            color: Colors.transparent, // Set the color to transparent
            elevation: 0, // Optionally, set the elevation to 0 to remove shadow
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(3, 0, 3, 0),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(
                    5), // Adjust the border radius as needed
                child: Image.asset(
                  'assets/images/avatars/BenjaminGan.png',
                  width: 40, // Set the desired width
                  height: 40, // Set the desired height
                ),
              ),
              title: Text(
                  style: Theme.of(context).textTheme.titleMedium?.apply(
                      color: Theme.of(context).colorScheme.onTertiaryContainer),
                  'Mary Jane'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '114,918',
                    style: Theme.of(context).textTheme.titleMedium?.apply(
                          color:
                              Theme.of(context).colorScheme.onTertiaryContainer,
                          fontSizeDelta: -3.5, // Adjust the font size as needed
                        ),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/images/brawlstars/misc/Trophy.png', // Replace with your image path
                    width: 24, // Set the desired width
                    height: 24, // Set the desired height
                  ),
                  // Adjust the spacing between the image and text
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 10.0,
          ),
          //Recruitment Requirements
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      style: Theme.of(context).textTheme.titleMedium?.apply(
                          color: Theme.of(context).colorScheme.secondary),
                      "Recruitment Requirements"),
                  const SizedBox(
                    height: 10.0,
                  ),
                ]),
          ),
          Center(
            child: DropdownMenu(
              label: Text('Trophy Requirements'),
              width: 370,
              initialSelection: 0,
              dropdownMenuEntries: trophiesEntries,
              inputDecorationTheme: InputDecorationTheme(
                  filled: true, constraints: BoxConstraints.expand()),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: DropdownMenu(
              label: Text('Min. 3v3 Wins'),
              width: 370,
              initialSelection: 0,
              dropdownMenuEntries: wins3v3Entries,
              inputDecorationTheme: InputDecorationTheme(
                  filled: true, constraints: BoxConstraints.expand()),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: DropdownMenu(
              label: Text('Min. Duo Wins'),
              width: 370,
              initialSelection: 0,
              dropdownMenuEntries: wins2v2Entries,
              inputDecorationTheme: InputDecorationTheme(
                  filled: true, constraints: BoxConstraints.expand()),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: DropdownMenu(
              label: Text('Min. Solo Wins'),
              width: 370,
              initialSelection: 0,
              dropdownMenuEntries: soloWinsEntries,
              inputDecorationTheme: InputDecorationTheme(
                  filled: true, constraints: BoxConstraints.expand()),
            ),
          ),

          SizedBox(height: 30),
          Center(
            child: FilledButton(
              onPressed: () {
                //Pending Function
              },
              child: Text(
                'Leave Team',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.errorContainer,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(current: "brawl_stars_profile"),
    );
  }
}
